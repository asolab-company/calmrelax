import Foundation

struct ServiceConfiguration: Codable, Sendable {
  var subscriptionProductIDs: [String] = ["calmweekly"]
  var privacyURL = "https://sites.google.com/view/calmrelaxwave"
  var termsURL = "https://sites.google.com/view/calmrelaxwave/terms-of-use"
  var appStoreURL = "https://apps.apple.com/app/id6821969078"
  var onboardingStyle = "immersive"
  var usesIllustrations: Bool {
    return onboardingStyle == "illustrated"
  }
  static let bundled: Self = {
    guard let url = Bundle.main.url(forResource: "ServiceConfiguration", withExtension: "json"),
      let data = try? Data(contentsOf: url),
      let config = try? JSONDecoder().decode(Self.self, from: data)
    else { return Self() }
    return config
  }()
  func secureURL(_ value: String) -> URL? {
    guard let url = URL(string: value), url.scheme == "https", url.host != nil else { return nil }
    return url
  }
}
