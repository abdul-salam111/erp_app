import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;
  final ThemeMode themeMode;

  const ThemeState({required this.isDarkMode})
    : themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeState copyWith({bool? isDarkMode}) {
    return ThemeState(isDarkMode: isDarkMode ?? this.isDarkMode);
  }

  @override
  List<Object?> get props => [isDarkMode];
}
