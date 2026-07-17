import 'package:equatable/equatable.dart';

abstract class PurchaseOrderEvent extends Equatable {
  const PurchaseOrderEvent();

  @override
  List<Object?> get props => [];
}

class PurchaseOrderFetched extends PurchaseOrderEvent {
  final String? search;

  const PurchaseOrderFetched({this.search});

  @override
  List<Object?> get props => [search];
}

class PurchaseOrderPageChanged extends PurchaseOrderEvent {
  final int page;

  const PurchaseOrderPageChanged(this.page);

  @override
  List<Object?> get props => [page];
}
