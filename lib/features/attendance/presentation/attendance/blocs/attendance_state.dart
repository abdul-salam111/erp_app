import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../views/widgets/attendance_types.dart';

class AttendanceState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final DateTime selectedMonth;
  final Map<int, AttendanceDay> attendanceData;

  AttendanceState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    DateTime? selectedMonth,
    this.attendanceData = const {},
  }) : selectedMonth = selectedMonth ??
            DateTime(DateTime.now().year, DateTime.now().month);

  bool get isCurrentMonth {
    final now = DateTime.now();
    return selectedMonth.year == now.year && selectedMonth.month == now.month;
  }

  AttendanceState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
    DateTime? selectedMonth,
    Map<int, AttendanceDay>? attendanceData,
  }) {
    return AttendanceState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      attendanceData: attendanceData ?? this.attendanceData,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus, selectedMonth, attendanceData];
}
