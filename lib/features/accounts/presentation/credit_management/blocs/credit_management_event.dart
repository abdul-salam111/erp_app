import 'package:equatable/equatable.dart';

abstract class CreditManagementEvent extends Equatable {
  const CreditManagementEvent();

  @override
  List<Object?> get props => [];
}

class CreditManagementSubmitted extends CreditManagementEvent {
  const CreditManagementSubmitted();
}

class CreditManagementDateChanged extends CreditManagementEvent {
  final DateTime date;
  const CreditManagementDateChanged(this.date);
  @override
  List<Object?> get props => [date];
}

class CreditManagementPartySelected extends CreditManagementEvent {
  final int partyId;
  const CreditManagementPartySelected(this.partyId);
  @override
  List<Object?> get props => [partyId];
}

class CreditManagementPartyCleared extends CreditManagementEvent {
  const CreditManagementPartyCleared();
}

class CreditManagementFilterCollapsed extends CreditManagementEvent {
  final bool collapsed;
  const CreditManagementFilterCollapsed(this.collapsed);
  @override
  List<Object?> get props => [collapsed];
}
