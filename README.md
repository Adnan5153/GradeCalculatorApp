# GradCal

GradCal is a Flutter-based grade tracker app that helps students add subjects, record marks, and monitor academic performance through summary analytics.

## Features

- Add new subjects with marks
- View a list of recorded subjects
- See overall grade, average mark, and performance insights
- Swipe to delete subjects with undo support
- Light and dark theme support

## Screens

- **Add Subject**: Add a subject name and mark to track performance
- **Subject List**: Review all entered subjects and delete items
- **Summary**: View academic insights and overall grade summary

## Prerequisites

Before running this project locally, make sure you have:

- Flutter SDK installed: https://docs.flutter.dev/get-started/install
- A connected device or emulator
- `flutter` available in your terminal PATH

## Local Setup

1. Clone the repository:

```bash
git clone <repository-url>
cd gradcal
```

2. Fetch dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

If you have multiple devices connected, choose one from the prompt or run:

```bash
flutter run -d <device-id>
```

## Using in Your Local Machine

- Open the project in Visual Studio Code or Android Studio.
- Use the terminal to run `flutter pub get`.
- Launch a simulator/emulator or connect a physical device.
- Start the app with `flutter run`, or use the editor's run/debug buttons.
- Make UI changes in `lib/` and hot-reload with `r` in the terminal or the editor's hot reload action.

## Recommended Workflow

- Use `flutter pub get` after pulling changes
- Run `flutter analyze` to check for issues
- Use `flutter test` if test files are added

## Notes

- The main app entry point is `lib/main.dart`.
- Core UI files are under `lib/features/grade_tracker/presentation/`.
- Themes are defined in `lib/core/theme/`.

---
