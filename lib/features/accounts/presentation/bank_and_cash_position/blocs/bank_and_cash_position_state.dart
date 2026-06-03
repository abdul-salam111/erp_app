import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';

class BankAndCashPositionState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const BankAndCashPositionState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  BankAndCashPositionState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return BankAndCashPositionState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
