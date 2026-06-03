import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_enums.dart';

class PartyLedgerState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;

  const PartyLedgerState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  PartyLedgerState copyWith({
    dynamic data,
    String? message,
    ApiStatus? apiStatus,
  }) {
    return PartyLedgerState(
      data: data ?? this.data,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus];
}
