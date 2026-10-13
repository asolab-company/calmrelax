import StoreKit
import SwiftUI

struct SettingsView: View {
  @Environment(LocalStore.self) private var store
  @Environment(ChatModel.self) private var chat
  @Environment(MassageSession.self) private var session
  @Environment(SubscriptionStore.self) private var subscriptions
  @Environment(\.requestReview) private var requestReview
  @State private var legal: LegalPage?
  @State private var deletingData = false
  @State private var notice: String?
  let showPaywall: () -> Void
  private let config = ServiceConfiguration.bundled
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        ScreenHeading(title: "Settings", subtitle: "Customize your experience.")
        premiumBanner
        VStack(alignment: .leading, spacing: 16) {
          Text("Support & Legal").font(.system(size: 16, weight: .bold))
          VStack(spacing: 0) {
            row("Privacy Policy", icon: "shield.fill") { legal = .privacy }
            divider
            row("Terms of Use", icon: "doc.text.fill") { legal = .terms }
          }.padding(.vertical, 7).calmPanel(radius: 20)
        }
        VStack(alignment: .leading, spacing: 16) {
          Text("General").font(.system(size: 16, weight: .bold))
          VStack(spacing: 0) {
            ShareLink(item: shareText) { rowLabel("Share App", icon: "square.and.arrow.up") }
              .buttonStyle(.plain)
            divider
            row("Rate Us", icon: "star.fill") { requestReview() }
            divider
            row(subscriptions.isBusy ? "Restoring…" : "Restore", icon: "clock.arrow.circlepath") {
              Task {
                await subscriptions.restore()
                notice = subscriptions.message
              }
            }
            .disabled(subscriptions.isBusy)
            divider
            row("Delete Data", icon: "trash.fill", color: Color(red: 0.92, green: 0.47, blue: 0.54))
            { deletingData = true }
          }.padding(.vertical, 7).calmPanel(radius: 20)
        }
      }.padding(.horizontal, 19).padding(.top, 6).padding(.bottom, 24)
    }.scrollIndicators(.hidden)
      .sheet(item: $legal) { LegalView(page: $0) }
      .alert("Delete local data?", isPresented: $deletingData) {
        Button("Cancel", role: .cancel) {}
        Button("Delete", role: .destructive) {
          session.stop()
          chat.clear()
          store.deleteData()
          notice = "Your mood history and chat have been deleted from this iPhone."
        }
      } message: {
        Text(
          "This permanently removes your mood history, chat, and preferences from this iPhone. Your subscription is kept."
        )
      }
      .alert(
        "Massage", isPresented: Binding(get: { notice != nil }, set: { if !$0 { notice = nil } })
      ) {
        Button("OK") { notice = nil }
      } message: {
        Text(notice ?? "")
      }
  }
  private var shareText: String {
    let message =
      "Take a moment for yourself with Massage — relaxing rhythms, mood check-ins and your calm companion."
    guard let url = config.secureURL(config.appStoreURL) else { return message }
    return message + "\n" + url.absoluteString
  }
  @ViewBuilder private var premiumBanner: some View {
    if subscriptions.hasPremium {
      premiumBannerContent(active: true)
    } else {
      Button(action: showPaywall) { premiumBannerContent(active: false) }
        .buttonStyle(.plain)
    }
  }
  private func premiumBannerContent(active: Bool) -> some View {
    HStack(spacing: 14) {
      Image(systemName: active ? "checkmark.seal.fill" : "crown.fill")
        .font(.system(size: 26)).frame(width: 52, height: 52)
        .background(.white.opacity(0.18), in: Circle())
      VStack(alignment: .leading, spacing: 5) {
        Text(active ? "Premium is active" : "Unlock Your Calm").font(
          .system(size: 20, weight: .bold))
        Text(active ? "All your calm, in one place." : "All modes, AI Chat & Mood")
          .font(.system(size: 13)).foregroundStyle(.white.opacity(0.85))
      }.frame(maxWidth: .infinity, alignment: .leading)
      if !active { Image(systemName: "arrow.up.right").font(.system(size: 18, weight: .semibold)) }
    }.foregroundStyle(.white).padding(18)
      .background(Palette.button, in: RoundedRectangle(cornerRadius: 26))
      .overlay(RoundedRectangle(cornerRadius: 26).stroke(.white.opacity(0.45), lineWidth: 1))
      .shadow(color: Palette.accent.opacity(0.18), radius: 12, y: 6)
  }
  private var divider: some View {
    Rectangle().fill(Palette.muted.opacity(0.15)).frame(height: 0.5).padding(.leading, 58)
  }
  private func row(
    _ title: String, icon: String, color: Color = Palette.muted, action: @escaping () -> Void
  ) -> some View {
    Button(action: action) { rowLabel(title, icon: icon, color: color) }.buttonStyle(.plain)
  }
  private func rowLabel(_ title: String, icon: String, color: Color = Palette.muted) -> some View {
    HStack(spacing: 12) {
      Image(systemName: icon).font(.system(size: 19)).foregroundStyle(color).frame(width: 30)
      Text(title).font(.system(size: 14, weight: .medium)).foregroundStyle(Palette.ink)
      Spacer()
      Image(systemName: "chevron.right").font(.system(size: 14)).foregroundStyle(Palette.accent)
    }.padding(.horizontal, 16).frame(minHeight: 51).contentShape(Rectangle())
  }
}
