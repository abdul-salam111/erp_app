import 'package:equatable/equatable.dart';

class CurrentStockEntity extends Equatable {
  final int itemId;
  final String itemName;
  final String invAmountBasedOn;
  final double currentQty;
  final double currentWeight;
  final double upcommingQty;
  final double upcommingWeight;
  final double totalQty;
  final double totalWeight;

  const CurrentStockEntity({
    required this.itemId,
    required this.itemName,
    required this.invAmountBasedOn,
    required this.currentQty,
    required this.currentWeight,
    required this.upcommingQty,
    required this.upcommingWeight,
    required this.totalQty,
    required this.totalWeight,
  });

  @override
  List<Object> get props => [
        itemId,
        itemName,
        invAmountBasedOn,
        currentQty,
        currentWeight,
        upcommingQty,
        upcommingWeight,
        totalQty,
        totalWeight,
      ];
}
