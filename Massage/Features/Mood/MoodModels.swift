import Foundation

enum Mood: String, CaseIterable, Codable, Identifiable {
  case loved = "Loved"
  case energetic = "Energetic"
  case happy = "Happy"
  case neutral = "Neutral"
  case sad = "Sad"
  var id: String { rawValue }
  var asset: String { "mood-" + rawValue.lowercased() }
}

struct MoodEntry: Codable, Equatable, Identifiable {
  var id: String
  var mood: Mood
}

struct CalendarDay: Identifiable {
  var id: Date
  var day: Int
  var inMonth: Bool
}

struct MoodCalendar {
  var calendar: Calendar = .current
  func key(for date: Date) -> String {
    let c = calendar.dateComponents([.year, .month, .day], from: date)
    return String(format: "%04d-%02d-%02d", c.year ?? 0, c.month ?? 0, c.day ?? 0)
  }
  func days(in month: Date) -> [CalendarDay] {
    guard let interval = calendar.dateInterval(of: .month, for: month),
      let count = calendar.range(of: .day, in: .month, for: month)
    else { return [] }
    let offset = calendar.component(.weekday, from: interval.start) - 1
    let cells = ((offset + count.count + 6) / 7) * 7
    return (0..<cells).compactMap { i in
      guard let d = calendar.date(byAdding: .day, value: i - offset, to: interval.start) else {
        return nil
      }
      return CalendarDay(
        id: d, day: calendar.component(.day, from: d),
        inMonth: i >= offset && i < offset + count.count)
    }
  }
}
