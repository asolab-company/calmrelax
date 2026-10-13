import Foundation

enum IntensityLevel: String, CaseIterable, Identifiable, Codable {
  static let sliderRange = 0.1...1.0
  case easy = "Easy"
  case medium = "Medium"
  case hard = "Hard"
  var id: String { rawValue }
  func hapticIntensity(at position: Double) -> Float {
    let range: ClosedRange<Float>
    switch self {
    case .easy: range = 0.35...0.6
    case .medium: range = 0.5...0.8
    case .hard: range = 0.65...1
    }
    let bounds = Self.sliderRange
    let progress = Float(
      (min(bounds.upperBound, max(bounds.lowerBound, position)) - bounds.lowerBound)
        / (bounds.upperBound - bounds.lowerBound))
    return range.lowerBound + progress * (range.upperBound - range.lowerBound)
  }
  var symbol: String {
    switch self {
    case .easy: "leaf.fill"
    case .medium: "cloud.fill"
    case .hard: "moon.fill"
    }
  }
}
