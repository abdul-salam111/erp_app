import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';

class AttendanceState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const AttendanceState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  AttendanceState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return AttendanceState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
