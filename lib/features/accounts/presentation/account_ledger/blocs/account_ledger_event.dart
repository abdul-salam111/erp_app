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

class AccountLedgerFromDateChanged extends AccountLedgerEvent {
  final DateTime date;
  const AccountLedgerFromDateChanged(this.date);
  @override
  List<Object?> get props => [date];
}

class AccountLedgerToDateChanged extends AccountLedgerEvent {
  final DateTime date;
  const AccountLedgerToDateChanged(this.date);
  @override
  List<Object?> get props => [date];
}

class AccountLedgerAccountSelected extends AccountLedgerEvent {
  final int accountId;
  const AccountLedgerAccountSelected(this.accountId);
  @override
  List<Object?> get props => [accountId];
}

class AccountLedgerFilterCollapsed extends AccountLedgerEvent {
  final bool collapsed;
  const AccountLedgerFilterCollapsed(this.collapsed);
  @override
  List<Object?> get props => [collapsed];
}
