import SwiftUI

struct PaywallView: View {
  @Environment(SubscriptionStore.self) private var subscriptions
  @Environment(\.dismiss) private var dismiss
  @State private var legal: LegalPage?
  private var illustrated: Bool { ServiceConfiguration.bundled.usesIllustrations }

  var body: some View {
    ZStack {
      AppBackground()
      GeometryReader { geometry in
        let compact = geometry.size.height < 700
        VStack(spacing: compact ? 10 : 16) {
          Image(illustrated ? "lotus" : "premium").resizable().scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.43)
            .layoutPriority(-1).accessibilityHidden(true)
          VStack(spacing: compact ? 6 : 8) {
            Text("Unlock Your Calm").font(.system(size: compact ? 28 : 32, weight: .bold))
              .lineLimit(1).minimumScaleFactor(0.8)
            Text("Feel better, relax deeper, and make time for yourself every day.")
              .font(.system(size: compact ? 14 : 16)).frame(maxWidth: 320)
            Text("All massage modes & intensity controls\nScreen lock · AI Chat · Mood tracker")
              .font(.system(size: 12, weight: .medium)).foregroundStyle(Palette.muted)
          }.multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
          HStack(spacing: 8) {
            Image(systemName: "crown.fill").font(.system(size: 20))
              .foregroundStyle(Palette.accent).frame(width: 34, height: 34)
              .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 2) {
              Text("Premium Experience").font(.system(size: 14, weight: .bold))
                .frame(height: 17)
              Text(subscriptions.priceDescription).font(.system(size: 12, weight: .medium))
                .foregroundStyle(Palette.muted).frame(height: 14)

            }.lineLimit(1)
            Spacer(minLength: 0)
            if subscriptions.isLoading {
              ProgressView()
            } else if subscriptions.selectedProduct == nil {
              Button("Retry") { Task { await subscriptions.prepare() } }.font(.footnote.bold())
            }
          }.padding(.horizontal, 16).frame(height: 66)
            .background(.white.opacity(0.3), in: RoundedRectangle(cornerRadius: 24))
          Text("Auto-renewing subscription. Cancel anytime in App Store settings.")
            .font(.system(size: 11)).foregroundStyle(Palette.muted)
            .multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
          PrimaryButton(
            title: subscriptions.isBusy ? "Please wait…" : "Continue",
            isEnabled: subscriptions.selectedProduct != nil && !subscriptions.isBusy
          ) {
            Task { await subscriptions.purchase() }
          }
          HStack(spacing: 0) {
            Button("Privacy Policy") { legal = .privacy }.frame(maxWidth: .infinity)
            Button("Skip") { dismiss() }.frame(maxWidth: .infinity)
            Button("Restore") { Task { await subscriptions.restore() } }.frame(maxWidth: .infinity)

            Button("Terms of Use") { legal = .terms }.frame(maxWidth: .infinity)
          }.font(.system(size: 11, weight: .medium)).foregroundStyle(Palette.muted)
            .frame(minHeight: 44).disabled(subscriptions.isBusy)
        }.padding(.horizontal, 19).padding(.vertical, compact ? 8 : 12)
          .frame(width: geometry.size.width, height: geometry.size.height)
      }
    }.foregroundStyle(Palette.ink)
      .sheet(item: $legal) { LegalView(page: $0) }
      .alert(
        "Subscription",
        isPresented: Binding(
          get: { subscriptions.message != nil }, set: { if !$0 { subscriptions.message = nil } })
      ) {
        Button("OK") { subscriptions.message = nil }
      } message: {
        Text(subscriptions.message ?? "")
      }
      .task {
        subscriptions.message = nil
        await subscriptions.prepare()
      }
      .onChange(of: subscriptions.hasPremium) { if subscriptions.hasPremium { dismiss() } }
  }
}
