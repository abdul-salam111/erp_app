import 'package:equatable/equatable.dart';

abstract class AccountLedgerEvent extends Equatable {
  const AccountLedgerEvent();

  @override
  List<Object?> get props => [];
}

class AccountLedgerSubmitted extends AccountLedgerEvent {
  final String fromDate;
  final String toDate;
  final int? accountId;

  const AccountLedgerSubmitted({
    required this.fromDate,
    required this.toDate,
    this.accountId,
  });

  @override
  List<Object?> get props => [fromDate, toDate, accountId];
}

class AccountLedgerAccountsFetched extends AccountLedgerEvent {
  const AccountLedgerAccountsFetched();
}

class AccountLedgerPrintRequested extends AccountLedgerEvent {
  final int featureId;
  final int parentEntityId;
  final String? featureName;
  final String? docNbr;

  const AccountLedgerPrintRequested({
    required this.featureId,
    required this.parentEntityId,
    this.featureName,
    this.docNbr,
  });

  @override
  List<Object?> get props => [featureId, parentEntityId];
}
