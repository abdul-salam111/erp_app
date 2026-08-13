## Flutter's Gradle plugin already merges the correct consumer ProGuard
## rules for the engine and every plugin automatically — no hand-written
## io.flutter.** keep rules needed (and keeping them defeats R8 shrinking
## across the app's ~15 native plugins).

## Suppress warnings for Play Core deferred components (not used in this app)
-dontwarn com.google.android.play.core.**
