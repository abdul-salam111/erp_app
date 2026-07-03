import 'package:equatable/equatable.dart';

class PartyUnpaidDebitEntity extends Equatable {
  final int debitId;
  final int partyId;
  final String docNbr;
  final String docDate;
  final String referenceDate;
  final double totalAmount;
  final double allocatedAmount;
  final double remainingAmount;
  final double markupAmount;
  final int daysOverdue;
  final String status;

  const PartyUnpaidDebitEntity({
    required this.debitId,
    required this.partyId,
    required this.docNbr,
    required this.docDate,
    required this.referenceDate,
    required this.totalAmount,
    required this.allocatedAmount,
    required this.remainingAmount,
    required this.markupAmount,
    required this.daysOverdue,
    required this.status,
  });

  bool get isUnpaid => status.toLowerCase() == 'unpaid';

  @override
  List<Object?> get props => [
        debitId,
        partyId,
        docNbr,
        docDate,
        referenceDate,
        totalAmount,
        allocatedAmount,
        remainingAmount,
        markupAmount,
        daysOverdue,
        status,
      ];
}
