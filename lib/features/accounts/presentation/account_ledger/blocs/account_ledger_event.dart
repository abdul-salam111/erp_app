import 'package:equatable/equatable.dart';

abstract class AccountLedgerEvent extends Equatable {
  const AccountLedgerEvent();

  @override
  List<Object> get props => [];
}

class AccountLedgerSubmitted extends AccountLedgerEvent {
  const AccountLedgerSubmitted();
}
