import 'package:equatable/equatable.dart';

abstract class PurchaseOrderEvent extends Equatable {
  const PurchaseOrderEvent();

  @override
  List<Object?> get props => [];
}

class PurchaseOrderFetched extends PurchaseOrderEvent {
  const PurchaseOrderFetched();
}

class PurchaseOrderSearchChanged extends PurchaseOrderEvent {
  final String query;

  const PurchaseOrderSearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class PurchaseOrderLoadMore extends PurchaseOrderEvent {
  const PurchaseOrderLoadMore();
}
