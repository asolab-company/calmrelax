import AVFoundation
import CoreHaptics

@MainActor
protocol MassageOutput: AnyObject {
  var supportsHaptics: Bool { get }
  var onUnexpectedStop: (() -> Void)? { get set }
  func start(mode: MassageMode, intensity: Float, sound: Bool) throws
  func stop()
}

private actor AmbientAudio {
  private var player: AVAudioPlayer?
  private var latestRevision = 0
  func setEnabled(_ enabled: Bool, revision: Int) throws {
    guard revision >= latestRevision else { return }
    latestRevision = revision
    guard enabled else {
      player?.stop()
      player = nil
      return
    }
    guard player == nil, let url = Bundle.main.url(forResource: "calm", withExtension: "wav") else {
      return
    }
    try AVAudioSession.sharedInstance().setCategory(
      .ambient, mode: .default, options: [.mixWithOthers])
    try AVAudioSession.sharedInstance().setActive(true)
    let audio = try AVAudioPlayer(contentsOf: url)
    audio.numberOfLoops = -1
    audio.volume = 0.35
    audio.prepareToPlay()
    guard audio.play() else { throw CocoaError(.fileReadUnknown) }
    player = audio
  }
}

@MainActor
final class HapticOutput: MassageOutput {
  let supportsHaptics = CHHapticEngine.capabilitiesForHardware().supportsHaptics
  var onUnexpectedStop: (() -> Void)?
  private var engine: CHHapticEngine?
  private var player: (any CHHapticAdvancedPatternPlayer)?
  private let audio = AmbientAudio()
  private var soundRevision = 0
  private var activeMode: MassageMode?
  private var generation = 0

  func start(mode: MassageMode, intensity: Float, sound: Bool) throws {
    if let player, activeMode == mode {
      try player.sendParameters(
        [
          CHHapticDynamicParameter(
            parameterID: .hapticIntensityControl, value: intensity, relativeTime: 0)
        ], atTime: CHHapticTimeImmediate)
      updateSound(enabled: sound)
      return
    }
    stop()
    let token = generation
    if supportsHaptics {
      let engine = try CHHapticEngine()
      self.engine = engine
      engine.playsHapticsOnly = true
      engine.isAutoShutdownEnabled = false
      engine.stoppedHandler = { [weak self] _ in
        Task { @MainActor in
          guard let self, self.generation == token else { return }
          self.onUnexpectedStop?()
        }
      }
      engine.resetHandler = { [weak self] in
        Task { @MainActor in
          guard let self, self.generation == token else { return }
          self.onUnexpectedStop?()
        }
      }
      try engine.start()
      let events = MassagePattern.pulses(for: mode).map { pulse in
        CHHapticEvent(
          eventType: .hapticContinuous,
          parameters: [
            CHHapticEventParameter(parameterID: .hapticIntensity, value: pulse.strength),
            CHHapticEventParameter(parameterID: .hapticSharpness, value: pulse.sharpness),
          ], relativeTime: pulse.time, duration: pulse.duration)
      }
      let pattern = try CHHapticPattern(events: events, parameters: [])
      let player = try engine.makeAdvancedPlayer(with: pattern)
      player.loopEnabled = true
      player.loopEnd = MassagePattern.duration
      self.player = player
      activeMode = mode
      try player.sendParameters(
        [
          CHHapticDynamicParameter(
            parameterID: .hapticIntensityControl, value: intensity, relativeTime: 0)
        ], atTime: CHHapticTimeImmediate)
      try player.start(atTime: CHHapticTimeImmediate)
    }
    updateSound(enabled: sound)
  }
  private func updateSound(enabled: Bool) {
    soundRevision += 1
    let revision = soundRevision
    Task { [weak self, audio] in
      do { try await audio.setEnabled(enabled, revision: revision) } catch {
        guard let self, self.soundRevision == revision else { return }
        self.onUnexpectedStop?()
      }
    }
  }
  func stop() {
    generation += 1
    try? player?.stop(atTime: CHHapticTimeImmediate)
    player = nil
    activeMode = nil
    engine?.stop(completionHandler: nil)
    engine = nil
    updateSound(enabled: false)
  }
}
