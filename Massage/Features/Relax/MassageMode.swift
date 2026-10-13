import Foundation

enum MassageMode: String, CaseIterable, Identifiable, Codable {
  case pulse = "Pulse"
  case breeze = "Breeze"
  case storm = "Storm"
  case bigWave = "Big Wave"
  case smallWave = "Small Wave"
  case eruption = "Eruption"
  case space = "Space"
  case comet = "Comet"
  case ship = "Ship"
  case harp = "Harp"
  case drums = "Drums"
  case auger = "Auger"
  var id: String { rawValue }
  var asset: String { "mode-" + String(Self.allCases.firstIndex(of: self)!) }
  var subtitle: String {
    switch self {
    case .pulse: "Calming rhythm"
    case .breeze: "Light vibration"
    case .storm: "Deep relaxation"
    case .bigWave: "Strong waves"
    case .smallWave: "Gentle waves"
    case .eruption: "Powerful pulses"
    case .space: "Cosmic rhythm"
    case .comet: "Rising pulses"
    case .ship: "Dynamic rhythm"
    case .harp: "Soft pulses"
    case .drums: "Rhythmic beats"
    case .auger: "Deep vibration"
    }
  }
}
