import 'package:equatable/equatable.dart';

class StockReceivedEntity extends Equatable {
  final int partyId;
  final String partyName;
  final String locationName;
  final String partyTypeName;
  final int itemId;
  final String? itemName;
  final int? itemCount;
  final double qty;
  final double weight;

  const StockReceivedEntity({
    required this.partyId,
    required this.partyName,
    required this.locationName,
    required this.partyTypeName,
    required this.itemId,
    this.itemName,
    this.itemCount,
    required this.qty,
    required this.weight,
  });

  @override
  List<Object?> get props => [
        partyId,
        partyName,
        locationName,
        partyTypeName,
        itemId,
        itemName,
        itemCount,
        qty,
        weight,
      ];
}
