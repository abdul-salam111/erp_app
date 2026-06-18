import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';

class CreditManagementState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const CreditManagementState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  CreditManagementState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return CreditManagementState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
