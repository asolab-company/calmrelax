import Foundation
import Observation

@Observable @MainActor
final class LocalStore {
  static let hourlyChatLimit = 20
  private(set) var entries: [MoodEntry] = []
  private(set) var messages: [ChatMessage] = [.welcome]
  var onboardingComplete: Bool {
    didSet { defaults.set(onboardingComplete, forKey: "onboardingComplete") }
  }
  var soundEnabled: Bool { didSet { defaults.set(soundEnabled, forKey: "soundEnabled") } }
  @ObservationIgnored private let defaults: UserDefaults
  @ObservationIgnored private let canUsePremium: () -> Bool
  let calendar: MoodCalendar

  init(
    defaults: UserDefaults = .standard, calendar: MoodCalendar = MoodCalendar(),
    canUsePremium: @escaping () -> Bool = { false }
  ) {
    self.defaults = defaults
    self.canUsePremium = canUsePremium
    self.calendar = calendar
    onboardingComplete = defaults.bool(forKey: "onboardingComplete")
    soundEnabled = defaults.bool(forKey: "soundEnabled")
    if let data = defaults.data(forKey: "moods"),
      let values = try? JSONDecoder().decode([MoodEntry].self, from: data)
    {
      entries = values
    }
    if let data = defaults.data(forKey: "chat"),
      let values = try? JSONDecoder().decode([ChatMessage].self, from: data), !values.isEmpty
    {
      messages = values
    }
  }
  func mood(on date: Date) -> Mood? { entries.first { $0.id == calendar.key(for: date) }?.mood }
  func save(_ mood: Mood, on date: Date, now: Date = .now) {
    guard canUsePremium() else { return }
    guard calendar.calendar.startOfDay(for: date) <= calendar.calendar.startOfDay(for: now) else {
      return
    }
    let id = calendar.key(for: date)
    entries.removeAll { $0.id == id }
    entries.append(MoodEntry(id: id, mood: mood))
    defaults.set(try? JSONEncoder().encode(entries), forKey: "moods")
  }
  func append(_ message: ChatMessage) {
    messages.append(message)
    defaults.set(try? JSONEncoder().encode(messages), forKey: "chat")
  }
  func clearChat() {
    messages = [.welcome]
    defaults.removeObject(forKey: "chat")
  }
  func reserveChatRequest(now: Date = .now) -> Date? {
    let key = "chatRequestTimes"
    let cutoff = now.timeIntervalSince1970 - 3600
    var times = (defaults.array(forKey: key) as? [Double] ?? [])
      .filter { $0.isFinite && $0 > cutoff }.sorted()
    if times.count >= Self.hourlyChatLimit {
      defaults.set(times, forKey: key)
      return Date(timeIntervalSince1970: times[times.count - Self.hourlyChatLimit] + 3600)
    }
    times.append(now.timeIntervalSince1970)
    defaults.set(times, forKey: key)
    return nil
  }
  func deleteData() {
    entries = []
    clearChat()
    soundEnabled = false
    defaults.removeObject(forKey: "moods")
  }
}
