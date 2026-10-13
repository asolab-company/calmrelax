import SwiftUI

struct ChatView: View {
  @Environment(LocalStore.self) private var store
  @Environment(ChatModel.self) private var chat
  @Environment(AppOverlay.self) private var overlay
  @State private var showingPrompts = false
  @State private var keyboardTop: CGFloat?
  @FocusState private var composerFocused: Bool
  var body: some View {
    @Bindable var chat = chat
    GeometryReader { geometry in
      VStack(spacing: 16) {
        HStack(alignment: .top) {
          ScreenHeading(title: "AI Chat", subtitle: "Talk. Reflect. Feel supported.")
          Button {
            composerFocused = false
            overlay.deletingChat = true
          } label: {
            Image(systemName: "trash.fill").font(.system(size: 18)).foregroundStyle(.white).frame(
              width: 44, height: 44)
          }.buttonStyle(.plain).accessibilityLabel("Delete chat")
        }
        .contentShape(Rectangle())
        .simultaneousGesture(TapGesture().onEnded { composerFocused = false })
        ScrollViewReader { proxy in
          ScrollView {
            VStack(spacing: 12) {
              Spacer(minLength: 0)
              ForEach(store.messages) { message in
                MessageBubble(message: message).id(message.id)
              }
              if chat.isSending {
                ChatThinkingBubble()
              }
              if let error = chat.error {
                VStack(alignment: .leading, spacing: 10) {
                  Text(error).font(.system(size: 14))
                  if store.messages.last?.role == .user {
                    Button("Try again") { chat.retry() }.font(.system(size: 14, weight: .bold))
                  }
                }.padding(16).frame(maxWidth: .infinity, alignment: .leading).calmPanel()
              }
              Color.clear.frame(height: 1).id("bottom")
            }.frame(maxWidth: .infinity)
              .onGeometryChange(for: CGFloat.self, of: { $0.size.height }) { _ in
                proxy.scrollTo("bottom", anchor: .bottom)
              }
          }.defaultScrollAnchor(.bottom).scrollDismissesKeyboard(.interactively)
            .contentShape(Rectangle())
            .simultaneousGesture(TapGesture().onEnded { composerFocused = false })

            .onChange(of: store.messages.count) { proxy.scrollTo("bottom", anchor: .bottom) }
            .onChange(of: chat.error) { proxy.scrollTo("bottom", anchor: .bottom) }
        }
        if showingPrompts || store.messages.count > 1 {
          ScrollView(.horizontal) {
            HStack(spacing: 8) {
              ForEach(["Breathing Exercise", "Relaxation Tips", "Calm Facts"], id: \.self) {
                prompt in
                Button(prompt) {
                  chat.draft = prompt
                  composerFocused = true
                }
                .font(.system(size: 12)).padding(.horizontal, 12).padding(.vertical, 12).calmPanel()
              }
            }
          }.scrollIndicators(.hidden)
        }
        HStack(spacing: 12) {
          Button {
            composerFocused = false
            showingPrompts.toggle()
          } label: {
            AppIcon(symbol: .composerAdd).foregroundStyle(Palette.accent)
              .frame(width: 36, height: 36)
              .background(.white.opacity(0.5), in: Circle())
              .overlay(
                Circle().strokeBorder(
                  LinearGradient(
                    colors: [.white.opacity(0.7), .clear, .gray.opacity(0.45)],
                    startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
              )
              .frame(width: 44, height: 44).contentShape(Circle())
          }
          .accessibilityLabel("Conversation suggestions")
          TextField("Type a message…", text: $chat.draft)
            .font(.system(size: 14)).foregroundStyle(Palette.accent).tint(Palette.accent)
            .focused($composerFocused)
            .submitLabel(.return).onSubmit(sendMessage)
          Button(action: sendMessage) {
            AppIcon(symbol: .composerSend).foregroundStyle(.white)
              .frame(width: 36, height: 36).background(Palette.button, in: Circle()).frame(
                width: 44, height: 44)
          }.disabled(
            chat.draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || chat.isSending
          )
          .accessibilityLabel("Send message")
        }.buttonStyle(.plain).padding(12)
          .background(.white.opacity(0.3), in: RoundedRectangle(cornerRadius: 32))
      }.padding(.horizontal, 19).padding(.top, 6)
        .padding(
          .bottom, keyboardTop.map { max(0, geometry.frame(in: .global).maxY - $0 + 8) } ?? 0
        )
        .background {
          Color.clear.contentShape(Rectangle())
            .onTapGesture { composerFocused = false }
        }
    }
    .onReceive(
      NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
    ) { notification in
      guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
      else { return }
      let duration =
        notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.25
      withAnimation(.easeOut(duration: duration)) { keyboardTop = frame.minY }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
    { notification in
      let duration =
        notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.25
      withAnimation(.easeOut(duration: duration)) { keyboardTop = nil }
    }
  }

  private func sendMessage() {
    guard !chat.isSending, !chat.draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    else { return }
    chat.send()
    composerFocused = false
  }
}

struct ChatThinkingBubble: View {
  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  @Environment(\.scenePhase) private var scenePhase

  var body: some View {
    HStack(alignment: .bottom, spacing: 8) {
      AppIcon(symbol: .companion).foregroundStyle(Palette.accent)
        .frame(width: 50, height: 50)
        .background(.white.opacity(0.22), in: Circle())
      TimelineView(
        .animation(minimumInterval: 1.0 / 30, paused: reduceMotion || scenePhase != .active)
      ) { context in
        HStack(spacing: 5) {
          ForEach(0..<3) { index in
            let phase =
              context.date.timeIntervalSinceReferenceDate * 2 * .pi / 1.2 - Double(index) * 0.7
            let emphasis = reduceMotion ? 0.5 : (sin(phase) + 1) / 2
            Circle().fill(Palette.ink)
              .frame(width: 9, height: 9)
              .opacity(0.3 + 0.4 * emphasis)
              .scaleEffect(0.85 + 0.15 * emphasis)
          }
        }.frame(width: 84, height: 38)
          .background(Palette.panel, in: Capsule())
      }
      Spacer(minLength: 0)
    }
    .accessibilityElement(children: .ignore)
    .accessibilityLabel("AI is preparing a response")

  }
}

struct DeleteChatDialog: View {
  @Environment(ChatModel.self) private var chat
  @Environment(AppOverlay.self) private var overlay
  var body: some View {
    ModalPanel {
      VStack(spacing: 8) {
        Image("delete-chat").resizable().scaledToFit().frame(height: 166)
        Text("Delete This Chat?").font(.system(size: 24, weight: .bold))
        Text("Are you sure you want to delete this conversation? This action can’t be undone.")
          .font(.system(size: 16, weight: .medium)).multilineTextAlignment(.center)
        HStack(spacing: 16) {
          Button("Cancel") { overlay.deletingChat = false }.font(.system(size: 16, weight: .bold))
            .frame(maxWidth: .infinity, minHeight: 50)
            .overlay(Capsule().stroke(Palette.accent, lineWidth: 1.5))
          Button("Delete", role: .destructive) {
            chat.clear()
            overlay.deletingChat = false
          }
          .font(.system(size: 16, weight: .bold)).foregroundStyle(.white)
          .frame(maxWidth: .infinity, minHeight: 50).background(Palette.button, in: Capsule())

        }.buttonStyle(.plain).padding(.top, 8)
      }
    }
  }
}

struct MessageBubble: View {
  let message: ChatMessage
  var body: some View {
    HStack(alignment: .bottom, spacing: 8) {
      if message.role == .user {
        Spacer(minLength: 30)
      } else {
        AppIcon(symbol: .companion).foregroundStyle(Palette.accent)
          .frame(width: 50, height: 50).background(.white.opacity(0.22), in: Circle())
          .accessibilityHidden(true)
      }
      Text(message.content).font(.system(size: 14)).fixedSize(horizontal: false, vertical: true)
        .foregroundStyle(message.role == .user ? .white : Palette.ink)
        .padding(16).background {
          RoundedRectangle(cornerRadius: 24).fill(
            message.role == .user ? Palette.accent.opacity(0.58) : Palette.panel)
        }
      if message.role == .assistant { Spacer(minLength: 0) }
    }.accessibilityElement(children: .combine)
  }
}
