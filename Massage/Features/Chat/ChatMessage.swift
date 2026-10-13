import Foundation

struct ChatMessage: Identifiable, Codable, Equatable, Sendable {
  enum Role: String, Codable, Sendable { case user, assistant }
  var id = UUID()
  var role: Role
  var content: String
  static let welcome = ChatMessage(
    role: .assistant,
    content: "Hi there! 👋\nI’m here to listen and help you unwind. How are you feeling today?")
}
