import 'package:equatable/equatable.dart';
import '../widgets/sale_order_items_table.dart';

abstract class CreateSaleOrderEvent extends Equatable {
  const CreateSaleOrderEvent();

  @override
  List<Object?> get props => [];
}

class SaleOrderDateChanged extends CreateSaleOrderEvent {
  final DateTime date;
  const SaleOrderDateChanged(this.date);
  @override
  List<Object?> get props => [date];
}

class SaleOrderRowAdded extends CreateSaleOrderEvent {
  final SaleOrderRowItem item;
  const SaleOrderRowAdded(this.item);
  @override
  List<Object?> get props => [item];
}

class SaleOrderRowRemoved extends CreateSaleOrderEvent {
  final int index;
  const SaleOrderRowRemoved(this.index);
  @override
  List<Object?> get props => [index];
}

class SaleOrderRowUpdated extends CreateSaleOrderEvent {
  final int index;
  final SaleOrderRowItem item;
  const SaleOrderRowUpdated(this.index, this.item);
  @override
  List<Object?> get props => [index, item];
}

class CreateSaleOrderSubmitted extends CreateSaleOrderEvent {
  const CreateSaleOrderSubmitted();
}
