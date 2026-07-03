## Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

## Suppress warnings for Play Core deferred components (not used in this app)
-dontwarn com.google.android.play.core.**

## Keep model classes used with json_serializable / freezed
-keep class com.manticerp.softronix.** { *; }

## Gson / JSON serialization
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
