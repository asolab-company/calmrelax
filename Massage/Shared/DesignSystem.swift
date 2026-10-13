import Observation
import SwiftUI

@Observable @MainActor
final class AppOverlay {
  var moodDate: Date?
  var deletingChat = false
  var isPresented: Bool { moodDate != nil || deletingChat }
}

enum Palette {
  static let accent = Color(red: 0.52549, green: 0.34118, blue: 0.91373)
  static let muted = Color(red: 0.61176, green: 0.54510, blue: 0.76863)
  static let ink = Color(red: 0.34929, green: 0.29749, blue: 0.47115)
  static let subtitle = Color(red: 0.89020, green: 0.84706, blue: 0.98824)
  static let panel = Color.white.opacity(0.42)
  static let button = LinearGradient(
    stops: [
      .init(color: Color(red: 0.67726, green: 0.52404, blue: 1), location: 0),
      .init(color: Color(red: 0.49804, green: 0.32941, blue: 0.89412), location: 0.65),
    ], startPoint: .topLeading, endPoint: .bottomTrailing)
}
struct AppBackground: View {
  var body: some View {
    GeometryReader { geometry in
      Image("Background").resizable().frame(
        width: geometry.size.width, height: geometry.size.height)
    }.ignoresSafeArea().accessibilityHidden(true)
  }
}
struct ScreenHeading: View {
  let title: String
  let subtitle: String
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(title).font(.system(size: 32, weight: .bold)).foregroundStyle(.white)
      Text(subtitle).font(.system(size: 14)).foregroundStyle(Palette.subtitle).fixedSize(
        horizontal: false, vertical: true)
    }.frame(maxWidth: .infinity, alignment: .leading)
  }
}
struct PrimaryButton: View {
  let title: String
  var isEnabled = true
  let action: () -> Void
  var body: some View {
    Button(action: action) {
      Text(title).font(.system(size: 16, weight: .bold)).foregroundStyle(.white)
        .frame(maxWidth: .infinity, minHeight: 60)
        .background(Palette.button, in: Capsule())
        .opacity(isEnabled ? 1 : 0.45)
    }.buttonStyle(.plain).disabled(!isEnabled)
  }
}
extension View {
  func calmPanel(radius: CGFloat = 24) -> some View {
    background(Palette.panel, in: RoundedRectangle(cornerRadius: radius))
  }
}
struct ModalPanel<Content: View>: View {
  @ViewBuilder let content: Content
  var body: some View {
    ZStack {
      Color.black.opacity(0.12).ignoresSafeArea()
      content.padding(16).frame(maxWidth: 380)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 28))
        .overlay(RoundedRectangle(cornerRadius: 28).stroke(.white.opacity(0.7), lineWidth: 1))
        .padding(19)
    }.accessibilityAddTraits(.isModal)
  }
}
struct CloseButton: View {
  let action: () -> Void
  var body: some View {
    Button(action: action) {
      Image(systemName: "xmark").font(.system(size: 14, weight: .semibold))
        .frame(width: 32, height: 32).background(.white.opacity(0.55), in: Circle())
        .frame(width: 44, height: 44)
    }.buttonStyle(.plain).foregroundStyle(Palette.accent).accessibilityLabel("Close")
  }
}
