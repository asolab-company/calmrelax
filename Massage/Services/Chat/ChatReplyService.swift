import Foundation

protocol ChatReplyService: Sendable {
  var isConfigured: Bool { get }
  func reply(to messages: [ChatMessage]) async throws -> String
}

enum ChatFailure: LocalizedError {
  case notConfigured, busy, premiumRequired

  var errorDescription: String? {
    switch self {
    case .notConfigured:
      "AI chat isn’t connected yet. Please try again when the service is available."
    case .busy: "Your companion is busy. Please wait a moment and try again."
    case .premiumRequired: "AI Chat is included with Premium."
    }
  }
}
