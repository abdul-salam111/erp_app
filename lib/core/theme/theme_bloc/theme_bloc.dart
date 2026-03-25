import '../../../app_exports.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final String _key = 'isDarkMode';

  ThemeBloc() : super(ThemeState(isDarkMode: false)) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);
    on<SetTheme>(_onSetTheme);
  }

  // Load theme from storage
  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final value = await storage.readValues(_key);
    final isDark = (value == 'true');
    emit(state.copyWith(isDarkMode: isDark));
    _updateSystemUIOverlay(isDark);
  }

  // Toggle theme
  Future<void> _onToggleTheme(
    ToggleTheme event,
    Emitter<ThemeState> emit,
  ) async {
    final newValue = !state.isDarkMode;
    await storage.setValues(_key, newValue.toString());
    emit(state.copyWith(isDarkMode: newValue));
    _updateSystemUIOverlay(newValue);
  }

  // Set specific theme
  Future<void> _onSetTheme(SetTheme event, Emitter<ThemeState> emit) async {
    await storage.setValues(_key, event.isDark.toString());
    emit(state.copyWith(isDarkMode: event.isDark));
    _updateSystemUIOverlay(event.isDark);
  }

  // Update system UI overlay style
  void _updateSystemUIOverlay(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
      isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );
  }
}
