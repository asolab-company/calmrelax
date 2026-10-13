import SafariServices
import SwiftUI

enum LegalPage: String, Identifiable {
  case privacy = "Privacy Policy"
  case terms = "Terms of Use"
  var id: String { rawValue }
}

struct LegalView: View {
  let page: LegalPage
  @Environment(\.dismiss) private var dismiss
  private let config = ServiceConfiguration.bundled

  var body: some View {
    Group {
      if let url = config.secureURL(page == .privacy ? config.privacyURL : config.termsURL) {
        LegalBrowser(url: url)
          .ignoresSafeArea(edges: .bottom)
      } else {
        NavigationStack {
          ContentUnavailableView(
            "Document unavailable", systemImage: "doc.text",
            description: Text("Please try again later.")
          )
          .navigationTitle(page.rawValue)
          .navigationBarTitleDisplayMode(.inline)
          .toolbar { ToolbarItem(placement: .confirmationAction) { Button("Done") { dismiss() } } }
        }
      }
    }
    .presentationDetents([.large])
    .presentationDragIndicator(.visible)
    .tint(Palette.accent)
  }
}

private struct LegalBrowser: UIViewControllerRepresentable {
  let url: URL

  func makeUIViewController(context: Context) -> SFSafariViewController {
    let controller = SFSafariViewController(url: url)
    controller.dismissButtonStyle = .done
    controller.preferredControlTintColor = UIColor(Palette.accent)
    return controller
  }

  func updateUIViewController(_ controller: SFSafariViewController, context: Context) {}

}
