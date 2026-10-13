import SwiftUI

enum AppTab: String, CaseIterable, Identifiable {
  case relax = "Relax"
  case mood = "Mood"
  case chat = "AI Chat"
  case settings = "Settings"
  var id: String { rawValue }
  var icon: AppSymbol {
    switch self {
    case .relax: .relax
    case .mood: .mood
    case .chat: .chat
    case .settings: .settings
    }
  }
}

struct AppRoot: View {
  @Environment(LocalStore.self) private var store
  @Environment(MassageSession.self) private var session
  @Environment(SubscriptionStore.self) private var subscriptions
  @State private var selectedTab: AppTab = .relax
  @State private var showPaywall = false
  @State private var showingLaunch = true
  @State private var overlay = AppOverlay()

  var body: some View {
    ZStack {
      ZStack {
        AppBackground()
        if showingLaunch {
          LoadingView().ignoresSafeArea()
        } else if !store.onboardingComplete {
          OnboardingView {
            store.onboardingComplete = true
            showPaywall = true
          }
        } else {
          VStack(spacing: 8) {
            Group {
              switch selectedTab {
              case .relax: RelaxView(showPaywall: { showPaywall = true })
              case .mood: MoodView()
              case .chat: ChatView()
              case .settings: SettingsView(showPaywall: { showPaywall = true })
              }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).clipped()
            tabBar
              .accessibilityHidden(session.isScreenLocked)
          }.ignoresSafeArea(.keyboard, edges: .bottom)
        }
      }.blur(radius: session.isScreenLocked ? 16 : (overlay.isPresented ? 7 : 0))
        .disabled(session.isScreenLocked)
        .allowsHitTesting(!overlay.isPresented && !session.isScreenLocked)
        .accessibilityHidden(overlay.isPresented || session.isScreenLocked)
      if let date = overlay.moodDate {
        MoodEditor(date: date, initialSelection: store.mood(on: date))
      }
      if overlay.deletingChat { DeleteChatDialog() }
      if session.isScreenLocked {
        ScreenLockOverlay { session.unlockScreen() }
      }
    }
    .statusBarHidden(session.isScreenLocked)
    .persistentSystemOverlays(session.isScreenLocked ? .hidden : .automatic)
    .foregroundStyle(Palette.ink)
    .environment(overlay)
    .fullScreenCover(isPresented: $showPaywall) { PaywallView() }
    .onChange(of: showPaywall) { if showPaywall { session.stop() } }
    .onChange(of: selectedTab) { session.stop() }
    .onChange(of: subscriptions.hasPremium) {
      if !subscriptions.hasPremium {
        selectedTab = .relax
        overlay.moodDate = nil
        overlay.deletingChat = false
      }
    }
    .task {
      try? await Task.sleep(for: .milliseconds(650))
      showingLaunch = false
    }
  }
  private var tabBar: some View {
    HStack(spacing: 0) {
      ForEach(AppTab.allCases) { tab in
        Button {
          if (tab == .mood || tab == .chat) && !subscriptions.hasPremium {
            showPaywall = true
          } else {
            selectedTab = tab
          }
        } label: {
          VStack(spacing: 4) {
            AppIcon(symbol: tab.icon).frame(height: 26)
            Text(tab.rawValue).font(.system(size: 10, weight: .medium))
          }.foregroundStyle(selectedTab == tab ? Palette.accent : Palette.muted)
            .frame(maxWidth: .infinity, minHeight: 62)
            .contentShape(Rectangle())
        }.buttonStyle(.plain)

          .accessibilityHint(
            (tab == .mood || tab == .chat) && !subscriptions.hasPremium ? "Requires Premium" : ""
          )
          .accessibilityAddTraits(selectedTab == tab ? .isSelected : [])
          .accessibilityHidden(session.isScreenLocked)
      }
    }.background(.white.opacity(0.52), in: Capsule())
      .overlay(Capsule().stroke(.white.opacity(0.7), lineWidth: 0.5))
      .padding(.horizontal, 19).padding(.bottom, 0)
  }
}

private struct ScreenLockOverlay: View {
  let unlock: () -> Void
  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  @State private var isDark = false
  @State private var hasDimmed = false

  var body: some View {
    ZStack {
      Color.black.opacity(isDark ? 1 : 0.18)
      Button(action: unlock) {
        ZStack {
          if !isDark {
            Circle().fill(Palette.accent.opacity(0.06)).frame(width: 196, height: 196)
            Circle().stroke(Palette.accent.opacity(0.12), lineWidth: 1).frame(
              width: 180, height: 180)
            if !reduceMotion {
              TimelineView(.animation(minimumInterval: 1.0 / 30)) { context in
                let pulse = (sin(context.date.timeIntervalSinceReferenceDate * .pi / 1.2) + 1) / 2
                Circle().stroke(.white.opacity(0.12 + pulse * 0.16), lineWidth: 2)
                  .frame(width: 158 + pulse * 36, height: 158 + pulse * 36)
              }.allowsHitTesting(false)
            }
            Image("PowerButton").resizable().frame(width: 140, height: 140)
            Circle().fill(Palette.accent).frame(width: 64, height: 64)
          } else {
            Circle().stroke(.white.opacity(0.18), lineWidth: 1).frame(width: 88, height: 88)
          }
          Image(systemName: "lock.fill")
            .font(.system(size: 30, weight: .medium))
            .foregroundStyle(.white.opacity(isDark ? 0.55 : 1))
        }
        .frame(width: 200, height: 200)
        .contentShape(Circle())
      }.buttonStyle(.plain)
        .accessibilityLabel("Unlock controls")
        .accessibilityHint("Tap to return to your running session")
        .accessibilityValue(hasDimmed ? "Dimmed" : "Locked")

      Text("Tap to unlock")
        .font(.system(size: 14, weight: .medium))
        .foregroundStyle(.white.opacity(isDark ? 0.45 : 0.9))
        .offset(y: 120)
        .accessibilityHidden(true)
        .allowsHitTesting(false)
    }
    .ignoresSafeArea()
    .task {
      do { try await Task.sleep(for: .seconds(4)) } catch { return }
      withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.6)) {
        isDark = true
      } completion: {
        hasDimmed = true
      }
    }
  }
}
