import 'package:equatable/equatable.dart';

abstract class CreditManagementEvent extends Equatable {
  const CreditManagementEvent();

  @override
  List<Object> get props => [];
}

class CreditManagementSubmitted extends CreditManagementEvent {
  const CreditManagementSubmitted();
}
