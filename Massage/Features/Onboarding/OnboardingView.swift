import SwiftUI

struct OnboardingView: View {
  let finish: () -> Void
  @State private var page = 0
  @State private var legal: LegalPage?
  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  private let titles = ["Find Your Calm", "Know Your Mood", "Here When You Need It"]
  private let subtitles = [
    "Choose a relaxing vibration, adjust the intensity, and take a moment for yourself.",
    "Check in with yourself every day and see how your mood changes over time.",
    "Share how you feel, talk things through, or get simple ideas to help you unwind.",
  ]
  private var illustrated: Bool { ServiceConfiguration.bundled.usesIllustrations }
  var body: some View {
    GeometryReader { geometry in
      let artHeight = max(210, geometry.size.height - 248)
      TabView(selection: $page) {
        ForEach(0..<3, id: \.self) { index in
          ScrollView {
            VStack(spacing: 0) {
              ZStack {
                if illustrated {
                  IllustratedOnboarding(page: index)
                } else {
                  Image("onboarding-\(index)").resizable().scaledToFill()
                    .frame(width: geometry.size.width, height: artHeight, alignment: .top)
                    .clipped()
                    .mask(
                      LinearGradient(
                        stops: [
                          .init(color: .black, location: 0), .init(color: .black, location: 0.80),
                          .init(color: .clear, location: 1),
                        ], startPoint: .top, endPoint: .bottom))
                }
              }.frame(height: artHeight)
              VStack(spacing: 8) {
                Text(titles[index]).font(.system(size: 32, weight: .bold)).minimumScaleFactor(0.75)
                  .lineLimit(1)

                Text(subtitles[index]).font(.system(size: 16)).frame(maxWidth: 300)
                  .fixedSize(horizontal: false, vertical: true)
              }.multilineTextAlignment(.center).padding(.horizontal, 20)
              HStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { index in
                  Circle().fill(page == index ? Palette.accent : Palette.muted.opacity(0.4)).frame(
                    width: 6, height: 6)
                }
              }.padding(.top, 22).padding(.bottom, 24).accessibilityLabel("Page \(page + 1) of 3")
              PrimaryButton(title: "Continue") {
                if page < 2 {
                  withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.25)) { page += 1 }
                } else {
                  finish()
                }
              }.padding(.horizontal, 19)
              if index == 0 {
                VStack(spacing: 1) {
                  Text("By proceeding you accept").foregroundStyle(Palette.muted)
                  HStack(spacing: 3) {
                    Text("our").foregroundStyle(Palette.muted)
                    Button("Terms of Use") { legal = .terms }
                    Text("and").foregroundStyle(Palette.muted)
                    Button("Privacy Policy") { legal = .privacy }
                  }
                }.font(.system(size: 12)).padding(.top, 14).frame(minHeight: 42)
              } else {
                Color.clear.frame(height: 42)
              }
            }.frame(minHeight: geometry.size.height, alignment: .top)
          }.scrollIndicators(.hidden)
            .ignoresSafeArea(.container, edges: .top)
            .tag(index)
            .accessibilityHidden(page != index)
        }
      }.tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea(.container, edges: .top)
    }
    .ignoresSafeArea(.container, edges: .top)
    .sheet(item: $legal) { LegalView(page: $0) }
  }
}

struct IllustratedOnboarding: View {
  let page: Int
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        if page < 2 {
          Image("illustrated-\(page)").resizable().scaledToFit()
        } else {
          VStack(spacing: 8) {
            ZStack {
              Circle().fill(Palette.accent.opacity(0.12))
              Circle().stroke(Palette.accent.opacity(0.12), lineWidth: 1)
              Circle().fill(Palette.accent.opacity(0.15)).padding(20)
              Image("companion").resizable().scaledToFit()
            }.frame(height: geometry.size.height * 0.53)
            MessageBubble(message: .welcome)
            Text("I’ve been feeling a little stressed lately. Can you help?")
              .font(.system(size: 13)).foregroundStyle(.white).padding(14)
              .frame(maxWidth: .infinity).background(Palette.accent.opacity(0.55), in: Capsule())
            Text(
              "Of course 💜 We can slow things down together. Would you like to try a breathing exercise, talk about what’s on your mind, or just have a quiet moment?"
            )
            .font(.system(size: 13)).padding(14).calmPanel().opacity(0.3)
          }.padding(.horizontal, 19)
            .mask(
              LinearGradient(
                stops: [.init(color: .black, location: 0.85), .init(color: .clear, location: 1)],
                startPoint: .top, endPoint: .bottom))
        }
      }.frame(width: geometry.size.width, height: geometry.size.height)
    }.accessibilityHidden(true)
  }
}
