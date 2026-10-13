import Foundation

struct HapticPulse: Equatable {
  var time: Double
  var duration: Double
  var strength: Float
  var sharpness: Float
}

struct MassagePattern {
  static let duration: Double = 4
  static func pulses(for mode: MassageMode) -> [HapticPulse] {
    switch mode {
    case .pulse:
      return stride(from: 0.0, to: 4, by: 0.8).flatMap { t in
        [
          HapticPulse(time: t, duration: 0.12, strength: 0.8, sharpness: 0.3),
          HapticPulse(time: t + 0.22, duration: 0.08, strength: 0.5, sharpness: 0.2),
        ]
      }
    case .breeze: return waves(count: 32, cycles: 1, floor: 0.12, peak: 0.5, sharpness: 0.1)
    case .storm: return beats(interval: 0.19, strength: 0.9, sharpness: 0.7)
    case .bigWave: return waves(count: 40, cycles: 2, floor: 0.1, peak: 1, sharpness: 0.35)
    case .smallWave: return waves(count: 40, cycles: 3, floor: 0.1, peak: 0.55, sharpness: 0.15)
    case .eruption:
      return (0..<16).map { i in
        HapticPulse(
          time: Double(i) * 0.25, duration: 0.15, strength: Float(i % 4 + 1) / 4, sharpness: 0.8)
      }
    case .space: return beats(interval: 0.65, strength: 0.6, sharpness: 0.15)
    case .comet:
      return (0..<40).map { i in
        HapticPulse(
          time: Double(i) * 0.1, duration: 0.1, strength: Float(i % 20 + 1) / 20, sharpness: 0.4)
      }
    case .ship: return waves(count: 40, cycles: 4, floor: 0.3, peak: 0.8, sharpness: 0.45)
    case .harp: return beats(interval: 0.4, strength: 0.35, sharpness: 0.2)
    case .drums:
      return (0..<16).map { i in
        HapticPulse(
          time: Double(i) * 0.25, duration: 0.07, strength: i % 4 == 0 ? 1 : 0.5, sharpness: 1)
      }
    case .auger: return waves(count: 40, cycles: 8, floor: 0.6, peak: 1, sharpness: 0.2)
    }
  }
  private static func beats(interval: Double, strength: Float, sharpness: Float) -> [HapticPulse] {
    stride(from: 0.0, to: duration - 0.12, by: interval).map {
      HapticPulse(
        time: $0, duration: min(0.12, interval / 2), strength: strength, sharpness: sharpness)
    }
  }
  private static func waves(count: Int, cycles: Double, floor: Float, peak: Float, sharpness: Float)
    -> [HapticPulse]
  {
    (0..<count).map { i in
      let phase = (1 - cos(Double(i) / Double(count) * .pi * 2 * cycles)) / 2
      return HapticPulse(
        time: Double(i) * duration / Double(count), duration: duration / Double(count),
        strength: floor + Float(phase) * (peak - floor), sharpness: sharpness)
    }
  }
}
