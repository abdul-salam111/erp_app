import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../models/leave_request_model.dart';

class LeavesState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final DateTime selectedMonth;
  final List<LeaveRequest> leaves;

  LeavesState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    DateTime? selectedMonth,
    this.leaves = const [],
  }) : selectedMonth = selectedMonth ??
            DateTime(DateTime.now().year, DateTime.now().month);

  bool get isCurrentMonth {
    final now = DateTime.now();
    return selectedMonth.year == now.year && selectedMonth.month == now.month;
  }

  int get totalDays => leaves.fold(0, (s, l) => s + l.days);
  int get sickDays => leaves
      .where((l) => l.type == LeaveType.sick)
      .fold(0, (s, l) => s + l.days);
  int get otherDays => leaves
      .where((l) => l.type == LeaveType.other)
      .fold(0, (s, l) => s + l.days);

  LeavesState copyWith({
    dynamic data,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
    DateTime? selectedMonth,
    List<LeaveRequest>? leaves,
  }) {
    return LeavesState(
      data: data ?? this.data,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      leaves: leaves ?? this.leaves,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus, selectedMonth, leaves];
}
