import SwiftUI

struct MoodView: View {
  @Environment(LocalStore.self) private var store
  @State private var month = Date.now
  @Environment(AppOverlay.self) private var overlay
  private let grid = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)
  private var title: String { month.formatted(.dateTime.month(.wide).year()) }

  var body: some View {
    GeometryReader { geometry in
      let compact = geometry.size.height < 650
      ScrollView {
        VStack(alignment: .leading, spacing: compact ? 16 : 24) {
          ScreenHeading(title: "Mood", subtitle: "Track your mood. Know yourself better.")
          calendar(compact: compact)
          if let mood = store.mood(on: .now) {
            Button {
              beginEditing(.now)
            } label: {
              VStack(spacing: 8) {
                Image(mood.asset).resizable().scaledToFit().frame(
                  width: compact ? 44 : 58, height: compact ? 44 : 58)
                Text("Mood saved!").font(.system(size: 20, weight: .bold))
                Text("You’re feeling \(mood.rawValue.lowercased()) today.").font(.system(size: 14))
              }.frame(maxWidth: .infinity).padding(.vertical, compact ? 12 : 20).calmPanel()
            }.buttonStyle(.plain)
          } else {
            VStack(alignment: .leading, spacing: 16) {
              Text("How are you feeling today?").font(.system(size: 16, weight: .bold))
              MoodChoices(selection: nil) { store.save($0, on: .now) }
            }.padding(16).padding(.vertical, 8).calmPanel()
          }
        }.padding(.horizontal, 19).padding(.top, 6).padding(.bottom, 24)
      }.scrollIndicators(.hidden)
    }
  }
  private func calendar(compact: Bool) -> some View {
    VStack(spacing: 10) {
      HStack {
        Button {
          moveMonth(-1)
        } label: {
          Image(systemName: "chevron.left").frame(width: 44, height: 44)
        }
        .accessibilityLabel("Previous month")
        Text(title).font(.system(size: 16, weight: .semibold)).frame(maxWidth: .infinity)
        Button {
          moveMonth(1)
        } label: {
          Image(systemName: "chevron.right").frame(width: 44, height: 44)
        }
        .accessibilityLabel("Next month")
      }.buttonStyle(.plain)
      HStack(spacing: 0) {
        ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"], id: \.self) { name in
          Text(name).font(.system(size: 11, weight: .medium)).foregroundStyle(Palette.muted).frame(
            maxWidth: .infinity)
        }
      }
      LazyVGrid(columns: grid, spacing: compact ? 4 : 6) {
        ForEach(store.calendar.days(in: month)) { day in
          Button {
            beginEditing(day.id)
          } label: {
            ZStack {
              if let mood = store.mood(on: day.id), day.inMonth {
                Image(mood.asset).resizable().scaledToFit().frame(width: 40, height: 40)
              } else {
                if Calendar.current.isDateInToday(day.id) {
                  Circle().fill(Palette.button).frame(width: 40, height: 40)
                }
                Text("\(day.day)").font(.system(size: 14, weight: .medium))
                  .foregroundStyle(Calendar.current.isDateInToday(day.id) ? .white : Palette.ink)
              }
            }.frame(maxWidth: .infinity, minHeight: 40).opacity(day.inMonth ? 1 : 0)
          }.buttonStyle(.plain)
            .disabled(!day.inMonth || day.id > Calendar.current.startOfDay(for: .now))
            .accessibilityHidden(!day.inMonth)
            .accessibilityLabel(day.id.formatted(date: .complete, time: .omitted))
            .accessibilityValue(store.mood(on: day.id)?.rawValue ?? "No mood recorded")
        }
      }
    }.padding(16).calmPanel()
  }
  private func moveMonth(_ value: Int) {
    if let next = Calendar.current.date(byAdding: .month, value: value, to: month) { month = next }
  }
  private func beginEditing(_ date: Date) { overlay.moodDate = date }
}

struct MoodEditor: View {
  @Environment(LocalStore.self) private var store
  @Environment(AppOverlay.self) private var overlay
  let date: Date
  @State private var selection: Mood?
  init(date: Date, initialSelection: Mood?) {
    self.date = date
    _selection = State(initialValue: initialSelection)
  }
  var body: some View {
    ModalPanel {
      VStack(alignment: .leading, spacing: 12) {
        HStack {
          Text("How did you feel?").font(.system(size: 16, weight: .bold))
          Spacer()
          CloseButton { overlay.moodDate = nil }
        }
        Text(date.formatted(date: .abbreviated, time: .omitted)).font(.caption).foregroundStyle(
          Palette.muted)
        MoodChoices(selection: selection) { selection = $0 }
        PrimaryButton(title: "Save", isEnabled: selection != nil) {
          if let selection { store.save(selection, on: date) }
          overlay.moodDate = nil
        }.padding(.top, 8)
      }
    }
  }
}

struct MoodChoices: View {
  let selection: Mood?
  let choose: (Mood) -> Void
  var body: some View {
    HStack(alignment: .top, spacing: 5) {
      ForEach(Mood.allCases) { mood in
        Button {
          choose(mood)
        } label: {
          VStack(spacing: 7) {
            Image(mood.asset).resizable().scaledToFit()
              .frame(maxWidth: 58)
              .opacity(selection == nil || selection == mood ? 1 : 0.4)
              .overlay(alignment: .bottomTrailing) {
                if selection == mood {
                  Image(systemName: "checkmark.circle.fill").font(.system(size: 16))
                    .foregroundStyle(.white, Palette.accent)
                }
              }
            Text(mood.rawValue).font(.system(size: 10, weight: .medium)).foregroundStyle(
              Palette.muted)
          }.frame(maxWidth: .infinity).contentShape(Rectangle())
        }.buttonStyle(.plain).accessibilityLabel(mood.rawValue)
          .accessibilityAddTraits(selection == mood ? .isSelected : [])
      }
    }
  }
}
