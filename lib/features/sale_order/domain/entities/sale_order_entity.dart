import 'package:equatable/equatable.dart';

class SaleOrderEntity extends Equatable {
  final String docNumber;
  final String partyName;
  final String date;
  final double netAmount;
  final String? refNo;
  final int rowsCount;
  final String? remarks;

  const SaleOrderEntity({
    required this.docNumber,
    required this.partyName,
    required this.date,
    required this.netAmount,
    this.refNo,
    required this.rowsCount,
    this.remarks,
  });

  @override
  List<Object?> get props => [docNumber, partyName, date, netAmount, refNo, rowsCount, remarks];
}
