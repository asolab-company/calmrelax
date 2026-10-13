import Foundation
import Observation
import UIKit

@Observable @MainActor
final class MassageSession {
  static let intensityRange = IntensityLevel.sliderRange
  private(set) var isRunning = false
  private(set) var message: String?
  var mode: MassageMode = .pulse {
    didSet {
      if !canUsePremium() && mode != .pulse { mode = .pulse }
      restartIfNeeded()
    }
  }
  var level: IntensityLevel = .easy {
    didSet {
      if !canUsePremium() && level != .easy { level = .easy }
      restartIfNeeded()
    }
  }
  var intensity: Double = intensityRange.lowerBound {
    didSet {
      let allowed =
        canUsePremium()
        ? min(Self.intensityRange.upperBound, max(Self.intensityRange.lowerBound, intensity))
        : Self.intensityRange.lowerBound
      if intensity != allowed { intensity = allowed }
      restartIfNeeded()
    }
  }
  var soundEnabled = false {
    didSet {
      if !canUsePremium() && soundEnabled { soundEnabled = false }
      restartIfNeeded()
    }
  }
  private(set) var isScreenLocked = false
  var supportsHaptics: Bool { output.supportsHaptics }
  @ObservationIgnored private let output: any MassageOutput
  @ObservationIgnored private var cutoff: Task<Void, Never>?
  @ObservationIgnored private let maxDuration: Duration
  @ObservationIgnored private let canUsePremium: () -> Bool

  init(
    output: any MassageOutput = HapticOutput(), maxDuration: Duration = .seconds(900),
    canUsePremium: @escaping () -> Bool = { false }
  ) {
    self.output = output
    self.maxDuration = maxDuration
    self.canUsePremium = canUsePremium
    output.onUnexpectedStop = { [weak self] in
      self?.stop()
      self?.message = "Session interrupted. Tap start when you’re ready."
    }
  }
  func toggle() { isRunning ? stop() : start() }
  func start() {
    if !canUsePremium() {
      stop()
      resetFreeSettings()
    }
    message = nil
    do {
      try output.start(
        mode: mode, intensity: level.hapticIntensity(at: intensity), sound: soundEnabled)
      isRunning = true
      UIApplication.shared.isIdleTimerDisabled = true
      cutoff?.cancel()
      cutoff = Task { [weak self, maxDuration] in
        do { try await Task.sleep(for: maxDuration) } catch { return }
        guard let self else { return }
        self.stop()
        self.message = "Session complete. Take a moment for yourself."
      }
    } catch {
      stop()
      message = "Couldn’t start this session. Please try again."
    }
  }
  func stop() {
    cutoff?.cancel()
    cutoff = nil
    output.stop()
    isRunning = false
    isScreenLocked = false
    UIApplication.shared.isIdleTimerDisabled = false
  }
  private func restartIfNeeded() {
    guard isRunning else { return }
    do {
      if canUsePremium() {
        try output.start(
          mode: mode, intensity: level.hapticIntensity(at: intensity), sound: soundEnabled)
      } else {
        try output.start(
          mode: .pulse,
          intensity: IntensityLevel.easy.hapticIntensity(at: Self.intensityRange.lowerBound),
          sound: false)
      }
    } catch {
      stop()
      message = "Session interrupted. Please try again."
    }
  }
  func lockScreen() {
    guard canUsePremium(), isRunning else { return }
    isScreenLocked = true
  }
  func unlockScreen() { isScreenLocked = false }
  func refreshAccess() {
    guard !canUsePremium() else { return }
    stop()
    resetFreeSettings()
  }
  private func resetFreeSettings() {
    mode = .pulse
    level = .easy
    intensity = Self.intensityRange.lowerBound
    soundEnabled = false
  }
}
