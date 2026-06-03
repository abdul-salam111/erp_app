import 'package:equatable/equatable.dart';

abstract class PartyLedgerEvent extends Equatable {
  const PartyLedgerEvent();

  @override
  List<Object> get props => [];
}

class PartyLedgerSubmitted extends PartyLedgerEvent {
  const PartyLedgerSubmitted();
}
