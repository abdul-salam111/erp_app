import 'package:equatable/equatable.dart';

abstract class PartyLedgerEvent extends Equatable {
  const PartyLedgerEvent();

  @override
  List<Object?> get props => [];
}

class PartyLedgerSubmitted extends PartyLedgerEvent {
  final String fromDate;
  final String toDate;
  final int? partyId;

  const PartyLedgerSubmitted({
    required this.fromDate,
    required this.toDate,
    this.partyId,
  });

  @override
  List<Object?> get props => [fromDate, toDate, partyId];
}

class PartyLedgerPartiesFetched extends PartyLedgerEvent {
  const PartyLedgerPartiesFetched();
}

class PartyLedgerPrintRequested extends PartyLedgerEvent {
  final int featureId;
  final int parentEntityId;
  final String? featureName;
  final String? docNbr;

  const PartyLedgerPrintRequested({
    required this.featureId,
    required this.parentEntityId,
    this.featureName,
    this.docNbr,
  });

  @override
  List<Object?> get props => [featureId, parentEntityId];
}
