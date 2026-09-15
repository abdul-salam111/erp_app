import 'package:equatable/equatable.dart';

class ProductionEntity extends Equatable {
  final int id;
  final String docNumber;
  final String date;
  final String? consumptionDoc;
  final String? consumptionDate;
  final String plant;
  final String process;
  final String shift;
  final String? remarks;
  final String? itemName;

  const ProductionEntity({
    required this.id,
    required this.docNumber,
    required this.date,
    this.consumptionDoc,
    this.consumptionDate,
    required this.plant,
    required this.process,
    required this.shift,
    this.remarks,
    this.itemName,
  });

  @override
  List<Object?> get props => [
        id,
        docNumber,
        date,
        consumptionDoc,
        consumptionDate,
        plant,
        process,
        shift,
        remarks,
        itemName,
      ];
}
