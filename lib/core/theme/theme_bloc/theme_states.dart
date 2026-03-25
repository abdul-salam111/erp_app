import 'package:flutter/material.dart';

class ThemeState {
  final bool isDarkMode;
  final ThemeMode themeMode;

  ThemeState({required this.isDarkMode})
    : themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeState copyWith({bool? isDarkMode}) {
    return ThemeState(isDarkMode: isDarkMode ?? this.isDarkMode);
  }
}
