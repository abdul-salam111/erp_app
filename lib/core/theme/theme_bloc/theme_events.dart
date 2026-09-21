// lib/core/theme/bloc/theme_event.dart
import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class LoadTheme extends ThemeEvent {}

class SetTheme extends ThemeEvent {
  final ThemeMode themeMode;

  SetTheme(this.themeMode);
}
