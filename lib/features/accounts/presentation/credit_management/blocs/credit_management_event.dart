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

class CreditManagementFinancialYearChanged extends CreditManagementEvent {
  final String? value;
  const CreditManagementFinancialYearChanged(this.value);
  @override
  List<Object?> get props => [value];
}

class CreditManagementCustomerTypeChanged extends CreditManagementEvent {
  final String? value;
  const CreditManagementCustomerTypeChanged(this.value);
  @override
  List<Object?> get props => [value];
}

class CreditManagementGroupOnChanged extends CreditManagementEvent {
  final String? value;
  const CreditManagementGroupOnChanged(this.value);
  @override
  List<Object?> get props => [value];
}

class CreditManagementCreditRatingChanged extends CreditManagementEvent {
  final String? value;
  const CreditManagementCreditRatingChanged(this.value);
  @override
  List<Object?> get props => [value];
}

class CreditManagementFilterCollapsed extends CreditManagementEvent {
  final bool collapsed;
  const CreditManagementFilterCollapsed(this.collapsed);
  @override
  List<Object?> get props => [collapsed];
}
