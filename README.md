# Shout

A distraction-free full-screen text input for those situations when you need to communicate something without speaking.

## Getting Started

1. Ensure you have [Flutter](https://docs.flutter.dev/get-started/install) installed (SDK >=3.8.1)
2. Clone this repository
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Development

The app is intentionally minimal with a single source file:

- `lib/main.dart` - Contains all app logic

To run on a specific platform:
```bash
flutter run -d chrome      # Web
flutter run -d macos        # macOS
flutter run -d linux        # Linux
flutter run -d windows      # Windows
flutter run -d <device_id>  # Android/iOS (use `flutter devices` to list)
```

## Testing

Run tests with:
```bash
flutter test
```

Run linting:
```bash
flutter analyze
```

## Publishing

### Android

1. Update `android/app/build.gradle.kts` with your signing configuration
2. Build the release APK or App Bundle:
   ```bash
   flutter build apk --release
   flutter build appbundle --release
   ```

### iOS

1. Open `ios/Runner.xcworkspace` in Xcode
2. Configure signing and capabilities
3. Build:
   ```bash
   flutter build ios --release
   ```

### Web

```bash
flutter build web --release
```
Output will be in `build/web/`

### Desktop (Linux/Windows/macOS)

```bash
flutter build linux --release
flutter build windows --release
flutter build macos --release
```
