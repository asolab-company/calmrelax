import FirebaseCore
import FirebaseRemoteConfig
import Foundation

@MainActor
final class FirebaseChatConfiguration {
  static let shared = FirebaseChatConfiguration()
  private var remoteConfig: RemoteConfig?

  func apiKey() async throws -> String {
    try Task.checkCancellation()
    if remoteConfig == nil {
      if FirebaseApp.app() == nil {
        guard let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
          let options = FirebaseOptions(contentsOfFile: path),
          options.bundleID == Bundle.main.bundleIdentifier
        else {
          throw OpenAIChatService.Failure.firebaseConfiguration
        }
        FirebaseConfiguration.shared.setLoggerLevel(.error)
        FirebaseApp.configure(options: options)
      }
      let config = RemoteConfig.remoteConfig()
      let settings = RemoteConfigSettings()
      settings.minimumFetchInterval = 60
      settings.fetchTimeout = 15
      config.configSettings = settings
      remoteConfig = config
    }
    guard let remoteConfig else { throw OpenAIChatService.Failure.firebaseConfiguration }
    do {
      _ = try await remoteConfig.fetchAndActivate()
    } catch {
      try Task.checkCancellation()
      let failure = error as NSError
      let underlying = failure.userInfo[NSUnderlyingErrorKey] as? NSError
      if underlying?.domain == "com.gul.keychain.ErrorDomain" {
        throw OpenAIChatService.Failure.firebaseKeychain
      }
      throw OpenAIChatService.Failure.firebaseFetch
    }
    try Task.checkCancellation()
    let value = remoteConfig.configValue(forKey: "OPENAI_API_KEY")
    guard value.source == .remote else { throw OpenAIChatService.Failure.missingKey }
    return try Self.validatedKey(value.stringValue)
  }

  static func validatedKey(_ value: String) throws -> String {
    let key = value.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !key.isEmpty else { throw OpenAIChatService.Failure.missingKey }
    guard !key.contains(where: { $0.isWhitespace }), !key.contains("\""), !key.contains("'") else {
      throw OpenAIChatService.Failure.invalidKey
    }
    return key
  }
}
