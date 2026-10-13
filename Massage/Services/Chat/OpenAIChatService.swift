import Foundation

struct OpenAIChatService: ChatReplyService {
  enum Failure: LocalizedError, Equatable {
    case firebaseConfiguration, firebaseFetch, firebaseKeychain, missingKey, invalidKey
    case authentication, quota, modelUnavailable, requestRejected, invalidResponse, unavailable
    var errorDescription: String? {
      switch self {
      case .firebaseConfiguration:
        "Firebase configuration doesn’t match this app. Please update the app configuration."
      case .firebaseFetch:
        "Couldn’t load chat settings from Firebase. Check your connection and try again."
      case .firebaseKeychain:
        "This build can’t access secure storage for Firebase. Please run a signed build from Xcode."
      case .missingKey:
        "OPENAI_API_KEY is missing from the published Firebase Remote Config. Please publish it and try again."
      case .invalidKey: "OPENAI_API_KEY must contain only the key, without quotes or spaces."
      case .authentication:
        "OpenAI rejected the API key. Update OPENAI_API_KEY in Firebase Remote Config and try again."
      case .quota:
        "The OpenAI project has no available API credit or has reached its spending limit. Please check its billing settings."
      case .modelUnavailable:
        "This OpenAI project doesn’t have access to the chat model. Please check its model permissions."
      case .requestRejected: "OpenAI couldn’t process this request. Please try again."
      case .invalidResponse: "Couldn’t read the companion’s response. Please try again."
      case .unavailable: "Your companion is temporarily unavailable. Please try again shortly."
      }
    }
  }
  let isConfigured = true
  var keyProvider: @Sendable () async throws -> String
  var transport: @Sendable (URLRequest) async throws -> (Data, URLResponse) = {
    try await URLSession.shared.data(for: $0)
  }

  static var live: Self {
    Self(keyProvider: { try await FirebaseChatConfiguration.shared.apiKey() })
  }

  func reply(to messages: [ChatMessage]) async throws -> String {
    guard messages.last?.role == .user else { throw Failure.invalidResponse }
    var size = 0
    var history: [[String: String]] = []
    for message in messages.suffix(40).reversed() {
      let content = String(message.content.prefix(4000))
      size += content.utf16.count
      if size > 16000 { break }
      history.insert(["role": message.role.rawValue, "content": content], at: 0)
    }
    let conversation = String(
      decoding: try JSONSerialization.data(withJSONObject: ["conversation": history]), as: UTF8.self
    )
    let key = try await keyProvider()
    try Task.checkCancellation()
    let gate: Scope = try await structured(
      instructions: ChatPolicy.gate, conversation: conversation,
      name: "massage_scope", field: "language", key: key, tokens: 128)
    if gate.kind != .inScope { return ChatPolicy.fixedReply(gate.kind, language: gate.language) }
    let answer: Answer = try await structured(
      instructions: ChatPolicy.reply, conversation: conversation,
      name: "massage_reply", field: "message", key: key, tokens: 600)
    if answer.kind != .inScope {
      return ChatPolicy.fixedReply(answer.kind, language: gate.language)
    }
    let message = answer.message.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !message.isEmpty, message.count <= 3000 else { throw Failure.invalidResponse }
    return message
  }

  private func structured<T: Decodable>(
    instructions: String, conversation: String, name: String,
    field: String, key: String, tokens: Int
  ) async throws -> T {
    try Task.checkCancellation()
    var request = URLRequest(url: URL(string: "https://api.openai.com/v1/responses")!)
    request.httpMethod = "POST"
    request.timeoutInterval = 25
    request.setValue("Bearer \(key)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    var fieldSchema: [String: Any] = ["type": "string"]
    if field == "language" { fieldSchema["enum"] = ["ru", "uk", "en"] }
    request.httpBody = try JSONSerialization.data(withJSONObject: [
      "model": "gpt-6-luna", "store": false, "reasoning": ["effort": "none"],
      "instructions": instructions, "input": [["role": "user", "content": conversation]],
      "max_output_tokens": tokens,
      "text": [
        "format": [
          "type": "json_schema", "name": name, "strict": true,
          "schema": [
            "type": "object", "additionalProperties": false,
            "properties": [
              "kind": ["type": "string", "enum": Kind.allCases.map(\.rawValue)], field: fieldSchema,
            ],
            "required": ["kind", field],
          ],
        ]
      ],
    ])
    let (data, response) = try await transport(request)
    try Task.checkCancellation()
    guard let http = response as? HTTPURLResponse else { throw Failure.invalidResponse }
    guard 200..<300 ~= http.statusCode else {
      let detail = (try? JSONDecoder().decode(APIError.self, from: data))?.error
      let code = detail?.code
      if http.statusCode == 401 { throw Failure.authentication }
      if detail?.type == "insufficient_quota"
        || ["insufficient_quota", "credit_balance_exhausted", "billing_hard_limit_reached"]
          .contains(code ?? "")
      {
        throw Failure.quota
      }
      if http.statusCode == 429 { throw ChatFailure.busy }
      if code == "model_not_found" || http.statusCode == 403 || http.statusCode == 404 {
        throw Failure.modelUnavailable
      }
      if http.statusCode >= 500 { throw Failure.unavailable }
      throw Failure.requestRejected
    }
    do {
      let result = try JSONDecoder().decode(Response.self, from: data)
      guard result.status == "completed" else { throw Failure.invalidResponse }
      let content = result.output.filter { $0.type == "message" }.flatMap { $0.content ?? [] }
      guard !content.contains(where: { $0.type == "refusal" }) else { throw Failure.unavailable }
      let text = content.filter { $0.type == "output_text" }.compactMap(\.text).joined()
      return try JSONDecoder().decode(T.self, from: Data(text.utf8))
    } catch let failure as Failure { throw failure } catch { throw Failure.invalidResponse }
  }

  enum Kind: String, Decodable, CaseIterable {
    case inScope = "in_scope"
    case outOfScope = "out_of_scope"
    case urgentSafety = "urgent_safety"
  }
  enum Language: String, Decodable { case ru, uk, en }
  private struct Scope: Decodable {
    var kind: Kind
    var language: Language
  }
  private struct Answer: Decodable {
    var kind: Kind
    var message: String
  }
  private struct APIError: Decodable {
    struct Detail: Decodable {
      var code: String?
      var type: String?
    }
    var error: Detail
  }
  private struct Response: Decodable {
    struct Output: Decodable {
      struct Content: Decodable {
        var type: String
        var text: String?
      }
      var type: String
      var content: [Content]?
    }
    var status: String
    var output: [Output]
  }
}
