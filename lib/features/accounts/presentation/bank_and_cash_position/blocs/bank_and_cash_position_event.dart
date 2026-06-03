import 'package:equatable/equatable.dart';

abstract class BankAndCashPositionEvent extends Equatable {
  const BankAndCashPositionEvent();

  @override
  List<Object> get props => [];
}

class BankAndCashPositionSubmitted extends BankAndCashPositionEvent {
  const BankAndCashPositionSubmitted();
}
