import '../api_debug_entry.dart';

class ApiDebugState {
  final bool isEnabled;
  final List<ApiDebugEntry> entries;
  final bool simulateExpiredToken;

  const ApiDebugState({
    required this.isEnabled,
    required this.entries,
    this.simulateExpiredToken = false,
  });

  ApiDebugState copyWith({
    bool? isEnabled,
    List<ApiDebugEntry>? entries,
    bool? simulateExpiredToken,
  }) {
    return ApiDebugState(
      isEnabled: isEnabled ?? this.isEnabled,
      entries: entries ?? this.entries,
      simulateExpiredToken: simulateExpiredToken ?? this.simulateExpiredToken,
    );
  }

  int get pendingCount => entries.where((e) => !e.isCompleted).length;
}
