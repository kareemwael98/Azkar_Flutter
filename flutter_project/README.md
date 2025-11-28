# Azkar Flutter App: "فَاذْكُرُونِي أَذْكُرْكُمْ"

## Overview
This is a Flutter port of the Azkar Android app. It helps Muslims keep track of their daily Azkar (remembrances) and Tasbeeh in a convenient and interactive way.

## Features
- 🌅 Morning Azkar (أذكار الصباح)
- 🌙 Evening Azkar (أذكار المساء)
- 🕌 After Prayer Azkar (أذكار بعد الصلاة)
- 📿 Digital Tasbeeh Counter (التسبيح)
- 🔊 Sound effects for completion
- 📊 Snackbar notifications showing remaining count

## Project Structure
```
flutter_project/
├── lib/
│   ├── main.dart           # App entry point
│   ├── theme.dart          # Colors, theme, and string constants
│   ├── models/
│   │   └── zekr.dart       # Zekr data model
│   ├── data/
│   │   └── azkar_data.dart # Azkar text data provider
│   └── screens/
│       ├── home_screen.dart    # Main menu screen
│       ├── azkar_screen.dart   # Azkar list display
│       └── tasbeeh_screen.dart # Digital counter
├── assets/
│   ├── images/             # App images (al_aqsa, sun, moon, etc.)
│   ├── fonts/              # DSEG Classic font for counter
│   └── sounds/             # Click sound effect
├── test/
│   └── azkar_data_test.dart # Unit tests
├── pubspec.yaml            # Flutter dependencies
└── analysis_options.yaml   # Linting rules
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK

### Installation
1. Navigate to the flutter_project directory
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

### Testing
```bash
flutter test
```

## Dependencies
- `flutter` - Flutter SDK
- `audioplayers` - For playing sound effects

## Original Android App
This Flutter app is a port of the original Android app written in Java. The original features and UI have been replicated as closely as possible.

## Credits
- Images and icons from www.freepik.com
- Developed through **Digital Egypt Pioneers Initiative - DEPI**
