import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api_debug_entry.dart';
import 'api_debug_state.dart';

const _kDebugEnabledKey = 'apiDebugEnabled';

class ApiDebugCubit extends Cubit<ApiDebugState> {
  ApiDebugCubit()
      : super(const ApiDebugState(isEnabled: false, entries: []));

  static const _storage = FlutterSecureStorage();

  Future<void> init() async {
    final value = await _storage.read(key: _kDebugEnabledKey);
    emit(state.copyWith(isEnabled: value == 'true'));
  }

  Future<void> toggleEnabled() async {
    final newVal = !state.isEnabled;
    await _storage.write(key: _kDebugEnabledKey, value: newVal.toString());
    emit(state.copyWith(isEnabled: newVal));
  }

  void addEntry(ApiDebugEntry entry) {
    final updated = [entry, ...state.entries].take(50).toList();
    emit(state.copyWith(entries: updated));
  }

  void completeEntry(
    String id, {
    int? statusCode,
    String? responsePreview,
    String? responseBody,
    bool isError = false,
    String? errorMessage,
  }) {
    final idx = state.entries.indexWhere((e) => e.id == id);
    if (idx == -1) return;
    final updated = List<ApiDebugEntry>.from(state.entries);
    updated[idx] = updated[idx].copyWith(
      endTime: DateTime.now(),
      statusCode: statusCode,
      responsePreview: responsePreview,
      responseBody: responseBody,
      isError: isError,
      errorMessage: errorMessage,
    );
    emit(state.copyWith(entries: updated));
  }

  void clearEntries() => emit(state.copyWith(entries: []));

  void toggleSimulateExpiredToken() {
    emit(state.copyWith(simulateExpiredToken: !state.simulateExpiredToken));
  }
}
