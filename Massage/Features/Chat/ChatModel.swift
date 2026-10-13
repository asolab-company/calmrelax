import Foundation
import Observation

@Observable @MainActor
final class ChatModel {
  var draft = ""
  private(set) var isSending = false
  var error: String?
  @ObservationIgnored private var requestTask: Task<Void, Never>?
  @ObservationIgnored private let store: LocalStore
  @ObservationIgnored private let service: any ChatReplyService
  @ObservationIgnored private let canUsePremium: () -> Bool
  init(
    store: LocalStore, service: any ChatReplyService,
    canUsePremium: @escaping () -> Bool = { false }
  ) {
    self.store = store
    self.service = service
    self.canUsePremium = canUsePremium
  }
  func send() {
    guard canUsePremium() else {
      error = ChatFailure.premiumRequired.localizedDescription
      return
    }
    let text = draft.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !text.isEmpty, !isSending else { return }
    guard service.isConfigured else {
      error = ChatFailure.notConfigured.localizedDescription
      return
    }
    guard reserveRequest() else { return }
    store.append(ChatMessage(role: .user, content: String(text.prefix(4000))))
    draft = ""
    requestReply()
  }
  func retry() {
    guard canUsePremium() else {
      error = ChatFailure.premiumRequired.localizedDescription
      return
    }
    guard store.messages.last?.role == .user, !isSending else { return }
    guard service.isConfigured else {
      error = ChatFailure.notConfigured.localizedDescription
      return
    }
    guard reserveRequest() else { return }
    requestReply()
  }
  private func reserveRequest() -> Bool {
    guard let retryAt = store.reserveChatRequest() else { return true }
    error =
      "Chat is limited to \(LocalStore.hourlyChatLimit) requests per hour. Try again after \(retryAt.formatted(date: .omitted, time: .shortened))."
    return false
  }
  private func requestReply() {
    error = nil
    isSending = true
    let history = store.messages
    requestTask = Task { [weak self, service] in
      do {
        let text = try await service.reply(to: history)
        try Task.checkCancellation()
        guard self?.canUsePremium() == true else {
          self?.refreshAccess()
          return
        }
        self?.store.append(ChatMessage(role: .assistant, content: text))
      } catch is CancellationError { return } catch {
        guard !Task.isCancelled else { return }
        self?.error = error.localizedDescription
      }
      self?.isSending = false
    }
  }
  func clear() {
    requestTask?.cancel()
    requestTask = nil
    isSending = false
    error = nil
    draft = ""
    store.clearChat()
  }
  func refreshAccess() {
    guard !canUsePremium() else { return }
    requestTask?.cancel()
    requestTask = nil
    isSending = false
    error = ChatFailure.premiumRequired.localizedDescription
  }
}
