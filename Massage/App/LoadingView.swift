import SwiftUI

struct LoadingView: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> UIViewController {
    UIStoryboard(name: "LaunchScreen", bundle: .main).instantiateInitialViewController()!
  }

  func updateUIViewController(_ controller: UIViewController, context: Context) {}
}
