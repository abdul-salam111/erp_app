import 'package:equatable/equatable.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();

  @override
  List<Object> get props => [];
}

class FetchInventoryData extends InventoryEvent {
  const FetchInventoryData();
}

class StockReceivedDateTypeChanged extends InventoryEvent {
  final String dateType;
  const StockReceivedDateTypeChanged(this.dateType);

  @override
  List<Object> get props => [dateType];
}
