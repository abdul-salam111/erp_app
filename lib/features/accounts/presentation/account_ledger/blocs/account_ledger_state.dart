import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';

class AccountLedgerState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const AccountLedgerState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  AccountLedgerState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return AccountLedgerState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
