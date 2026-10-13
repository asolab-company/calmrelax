import AVFoundation
import SwiftUI

@main
struct MassageApp: App {
  @State private var store: LocalStore
  @State private var session: MassageSession
  @State private var subscriptions: SubscriptionStore
  @State private var chat: ChatModel
  @Environment(\.scenePhase) private var scenePhase

  init() {
    let subscriptions = SubscriptionStore(
      productIDs: ServiceConfiguration.bundled.subscriptionProductIDs)
    let store = LocalStore(canUsePremium: { subscriptions.hasPremium })
    _store = State(initialValue: store)
    _subscriptions = State(initialValue: subscriptions)
    _session = State(initialValue: MassageSession(canUsePremium: { subscriptions.hasPremium }))
    let chatService: any ChatReplyService = OpenAIChatService.live
    _chat = State(
      initialValue: ChatModel(
        store: store, service: chatService, canUsePremium: { subscriptions.hasPremium }))
  }
  var body: some Scene {
    WindowGroup {
      AppRoot()
        .environment(store).environment(session).environment(subscriptions).environment(chat)
        .preferredColorScheme(.light)
        .tint(Palette.accent)
        .task {
          session.soundEnabled = store.soundEnabled
          await subscriptions.prepare()
        }
        .onChange(of: store.soundEnabled) { session.soundEnabled = store.soundEnabled }
        .onChange(of: subscriptions.hasPremium) {
          session.refreshAccess()
          chat.refreshAccess()
          if subscriptions.hasPremium { session.soundEnabled = store.soundEnabled }
        }
        .onChange(of: scenePhase) {
          if scenePhase != .active {
            session.stop()
          } else {
            Task { await subscriptions.refreshEntitlements() }
          }
        }
        .onReceive(
          NotificationCenter.default.publisher(for: AVAudioSession.interruptionNotification)
        ) { _ in session.stop() }
    }
  }
}
