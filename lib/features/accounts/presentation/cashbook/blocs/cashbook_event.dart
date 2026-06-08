import 'package:equatable/equatable.dart';

abstract class CashbookEvent extends Equatable {
  const CashbookEvent();

  @override
  List<Object?> get props => [];
}

class CashbookSubmitted extends CashbookEvent {
  final String fromDate;
  final String toDate;
  final int? accountId;

  const CashbookSubmitted({
    required this.fromDate,
    required this.toDate,
    this.accountId,
  });

  @override
  List<Object?> get props => [fromDate, toDate, accountId];
}

class CashbookAccountsFetched extends CashbookEvent {
  const CashbookAccountsFetched();
}

class CashbookPrintRequested extends CashbookEvent {
  final int featureId;
  final int parentEntityId;
  final String? featureName;
  final String? docNbr;

  const CashbookPrintRequested({
    required this.featureId,
    required this.parentEntityId,
    this.featureName,
    this.docNbr,
  });

  @override
  List<Object?> get props => [featureId, parentEntityId];
}
