import SwiftUI

struct RelaxView: View {
  @Environment(MassageSession.self) private var session
  @Environment(SubscriptionStore.self) private var subscriptions
  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  let showPaywall: () -> Void
  private var isLocked: Bool { !subscriptions.hasPremium && session.mode != .pulse }

  var body: some View {
    @Bindable var session = session
    GeometryReader { geometry in
      let compact = geometry.size.height < 650
      let powerSize: CGFloat = compact ? 150 : 220
      ScrollView {
        VStack(spacing: 0) {
          ScreenHeading(title: "Relax", subtitle: "Take a deep breath. You deserve this moment.")
            .padding(.horizontal, 19).padding(.bottom, compact ? 16 : 24)
          HStack(spacing: 6) {
            ForEach(IntensityLevel.allCases) { level in
              Button {
                if subscriptions.hasPremium { session.level = level } else { showPaywall() }
              } label: {
                HStack(spacing: 4) {
                  AppIcon(symbol: level == .easy ? .easy : level == .medium ? .medium : .hard)
                  Text(level.rawValue)
                }
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 44)
                .foregroundStyle(session.level == level ? .white : Palette.accent)
                .background { if session.level == level { Capsule().fill(Palette.button) } }
                .contentShape(Capsule())
              }.buttonStyle(.plain)
                .accessibilityHint(subscriptions.hasPremium ? "" : "Requires Premium")
                .accessibilityAddTraits(session.level == level ? .isSelected : [])
            }
          }.padding(4).calmPanel(radius: 30).padding(.horizontal, 19)
          HStack(spacing: 16) {
            HStack(spacing: 6) {
              AppIcon(symbol: .intensity)
              Text("Intensity")
            }
            .font(.system(size: 14, weight: .medium)).fixedSize()
            VStack(spacing: 0) {
              if subscriptions.hasPremium {
                Slider(value: $session.intensity, in: MassageSession.intensityRange)
                  .accessibilityLabel("Intensity")
                  .accessibilityValue("\(Int(session.intensity * 100)) percent")
              } else {
                Button(action: showPaywall) {
                  Slider(
                    value: .constant(MassageSession.intensityRange.lowerBound),
                    in: MassageSession.intensityRange
                  ).disabled(true).allowsHitTesting(false).accessibilityHidden(true)
                    .frame(minHeight: 44).contentShape(Rectangle())
                }.buttonStyle(.plain).accessibilityLabel("Unlock intensity with Premium")
                  .accessibilityValue("Minimum intensity")

              }
              HStack {
                Text("Gentle")
                Spacer()
                Text("Strong")
              }
              .font(.system(size: 12, weight: .medium)).foregroundStyle(Palette.muted)
            }
          }.padding(.horizontal, 16).padding(.vertical, 10).calmPanel().padding(.horizontal, 19)
            .padding(.top, 16)
          ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 12) {
              ForEach(MassageMode.allCases) { mode in
                Button {
                  if mode == .pulse || subscriptions.hasPremium {
                    session.mode = mode
                  } else {
                    showPaywall()
                  }
                } label: {
                  VStack(spacing: 4) {
                    Image(mode.asset).resizable().scaledToFit().frame(width: 80, height: 80)
                      .opacity(session.mode == mode ? 1 : 0.32)
                      .background {
                        if session.mode == mode {
                          Circle().fill(.white.opacity(0.15)).shadow(
                            color: Palette.accent.opacity(0.25), radius: 6)
                        }
                      }
                    Text(mode.rawValue).font(.system(size: 14, weight: .medium))
                    Text(mode.subtitle).font(.system(size: 10, weight: .medium)).foregroundStyle(
                      Palette.muted
                    ).lineLimit(1).minimumScaleFactor(0.85)
                  }.frame(width: 80).foregroundStyle(Palette.ink)
                }.buttonStyle(.plain)
                  .accessibilityLabel("\(mode.rawValue), \(mode.subtitle)")
                  .accessibilityHint(
                    mode != .pulse && !subscriptions.hasPremium ? "Requires Premium" : ""
                  )
                  .accessibilityAddTraits(session.mode == mode ? .isSelected : [])
              }
            }.padding(.horizontal, 19).padding(.vertical, 4)
          }.scrollIndicators(.hidden).padding(.top, 12)
          Spacer(minLength: compact ? 8 : 20)
          Button {
            if isLocked { showPaywall() } else { session.toggle() }
          } label: {
            ZStack {
              Circle().fill(Palette.accent.opacity(0.04)).frame(width: 220)
              Circle().stroke(Palette.accent.opacity(0.05), lineWidth: 1).frame(width: 220)
              Circle().fill(Palette.accent.opacity(0.06)).frame(width: 190)
              if session.isRunning && !session.isScreenLocked && !reduceMotion {
                TimelineView(.animation(minimumInterval: 1.0 / 30)) { context in
                  let phase = (sin(context.date.timeIntervalSinceReferenceDate * .pi / 1.2) + 1) / 2
                  Circle().stroke(Palette.accent.opacity(0.12 + phase * 0.12), lineWidth: 2)
                    .frame(width: 190 + phase * 26, height: 190 + phase * 26)
                }.allowsHitTesting(false).accessibilityHidden(true)
              }
              Image("PowerButton").resizable().frame(width: 156, height: 156)
                .opacity(isLocked ? 0.4 : 1)
              if session.isRunning {
                Circle().fill(Palette.accent).frame(width: 62)
                Image(systemName: "stop.fill").font(.system(size: 25, weight: .bold))
                  .foregroundStyle(.white)
              }
            }.frame(width: 220, height: 220)
              .scaleEffect(powerSize / 220)
              .frame(width: powerSize, height: powerSize)
          }.buttonStyle(.plain)
            .accessibilityLabel(session.isRunning ? "Stop massage" : "Start massage")
            .accessibilityValue(session.isRunning ? "Running" : "Stopped")
          Button {
            if !subscriptions.hasPremium { showPaywall() } else { session.lockScreen() }
          } label: {
            Image(systemName: subscriptions.hasPremium ? "lock.open.fill" : "lock.fill")
              .font(.system(size: 20)).foregroundStyle(.white.opacity(isLocked ? 1 : 0.5))
              .frame(width: 44, height: 44).background(Palette.accent.opacity(0.08), in: Circle())
          }.buttonStyle(.plain).accessibilityLabel(
            subscriptions.hasPremium ? "Lock controls" : "Unlock screen lock with Premium"
          )

          .disabled(subscriptions.hasPremium && !session.isRunning)
          .padding(.top, compact ? 12 : 16)
          if let message = session.message {
            Text(message).font(.footnote).multilineTextAlignment(.center).padding(.horizontal, 24)
              .padding(.top, 8)
          }
          Spacer(minLength: compact ? 8 : 12)
        }.padding(.top, 6).frame(minHeight: geometry.size.height)
      }.scrollIndicators(.hidden)
    }
  }
}
