import 'package:equatable/equatable.dart';
import '../../../../../core/constants/app_enums.dart';

class ApplyLoanState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const ApplyLoanState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  ApplyLoanState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return ApplyLoanState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
