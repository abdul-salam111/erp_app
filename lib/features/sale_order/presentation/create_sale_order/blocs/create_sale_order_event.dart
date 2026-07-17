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

class SaleOrderDetailRequested extends CreateSaleOrderEvent {
  final int orderId;
  const SaleOrderDetailRequested(this.orderId);
  @override
  List<Object?> get props => [orderId];
}

class SaleOrderPartiesRequested extends CreateSaleOrderEvent {
  const SaleOrderPartiesRequested();
}

class SaleOrderCustomerSelected extends CreateSaleOrderEvent {
  final String name;
  const SaleOrderCustomerSelected(this.name);
  @override
  List<Object?> get props => [name];
}

class SaleOrderBrokerSelected extends CreateSaleOrderEvent {
  final String name;
  const SaleOrderBrokerSelected(this.name);
  @override
  List<Object?> get props => [name];
}
