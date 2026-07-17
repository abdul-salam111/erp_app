import 'package:equatable/equatable.dart';
import '../widgets/purchase_order_items_table.dart';

abstract class CreatePurchaseOrderEvent extends Equatable {
  const CreatePurchaseOrderEvent();

  @override
  List<Object?> get props => [];
}

class PurchaseOrderDateChanged extends CreatePurchaseOrderEvent {
  final DateTime date;
  const PurchaseOrderDateChanged(this.date);
  @override
  List<Object?> get props => [date];
}

class PurchaseOrderRowAdded extends CreatePurchaseOrderEvent {
  final PurchaseOrderRowItem item;
  const PurchaseOrderRowAdded(this.item);
  @override
  List<Object?> get props => [item];
}

class PurchaseOrderRowRemoved extends CreatePurchaseOrderEvent {
  final int index;
  const PurchaseOrderRowRemoved(this.index);
  @override
  List<Object?> get props => [index];
}

class PurchaseOrderRowUpdated extends CreatePurchaseOrderEvent {
  final int index;
  final PurchaseOrderRowItem item;
  const PurchaseOrderRowUpdated(this.index, this.item);
  @override
  List<Object?> get props => [index, item];
}

class CreatePurchaseOrderSubmitted extends CreatePurchaseOrderEvent {
  const CreatePurchaseOrderSubmitted();
}

class PurchaseOrderDetailRequested extends CreatePurchaseOrderEvent {
  final int orderId;
  const PurchaseOrderDetailRequested(this.orderId);
  @override
  List<Object?> get props => [orderId];
}

class PurchaseOrderPartiesRequested extends CreatePurchaseOrderEvent {
  const PurchaseOrderPartiesRequested();
}

class PurchaseOrderSupplierSelected extends CreatePurchaseOrderEvent {
  final String name;
  const PurchaseOrderSupplierSelected(this.name);
  @override
  List<Object?> get props => [name];
}

class PurchaseOrderBrokerSelected extends CreatePurchaseOrderEvent {
  final String name;
  const PurchaseOrderBrokerSelected(this.name);
  @override
  List<Object?> get props => [name];
}