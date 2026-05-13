// lib/core/theme/bloc/theme_event.dart
abstract class ThemeEvent {}

class LoadTheme extends ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class SetTheme extends ThemeEvent {
  final bool isDark;

  SetTheme(this.isDark);
}
