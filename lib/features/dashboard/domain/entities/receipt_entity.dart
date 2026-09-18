import 'package:equatable/equatable.dart';

class ReceiptEntity extends Equatable {
  final int      id;
  final String   docNbr;
  final DateTime docDate;
  final String   mode;
  final double   amount;
  final String   partyName;
  final String   accountName;
  final String   currencySymbol;

  const ReceiptEntity({
    required this.id,
    required this.docNbr,
    required this.docDate,
    required this.mode,
    required this.amount,
    required this.partyName,
    required this.accountName,
    required this.currencySymbol,
  });

  @override
  List<Object?> get props => [
    id, docNbr, docDate, mode, amount, partyName, accountName, currencySymbol,
  ];
}
