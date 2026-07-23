import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';

class ApplyOvertimeState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const ApplyOvertimeState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  ApplyOvertimeState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return ApplyOvertimeState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
