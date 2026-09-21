import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/shared_pref_key.dart';
import '../../local_storage/storage.dart';
import '../theme_exports.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final String _key = StorageKeys.themeMode;

  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.system)) {
    on<LoadTheme>(_onLoadTheme, transformer: droppable());
    on<SetTheme>(_onSetTheme, transformer: droppable());
  }

  // Load theme from storage
  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final value = await storage.readValues(_key);
    final mode = _themeModeFromStorage(value);
    emit(state.copyWith(themeMode: mode));
    _updateSystemUIOverlay(mode);
  }

  // Set specific theme
  Future<void> _onSetTheme(SetTheme event, Emitter<ThemeState> emit) async {
    await storage.setValues(_key, event.themeMode.name);
    emit(state.copyWith(themeMode: event.themeMode));
    _updateSystemUIOverlay(event.themeMode);
  }

  ThemeMode _themeModeFromStorage(String? value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  // Update system UI overlay style
  void _updateSystemUIOverlay(ThemeMode mode) {
    final isDark = mode == ThemeMode.dark ||
        (mode == ThemeMode.system &&
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(
      isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );
  }
}
