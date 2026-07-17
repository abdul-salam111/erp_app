import 'package:equatable/equatable.dart';

abstract class SaleOrderEvent extends Equatable {
  const SaleOrderEvent();

  @override
  List<Object?> get props => [];
}

class SaleOrderFetched extends SaleOrderEvent {
  const SaleOrderFetched();
}

class SaleOrderSearchChanged extends SaleOrderEvent {
  final String query;

  const SaleOrderSearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class SaleOrderLoadMore extends SaleOrderEvent {
  const SaleOrderLoadMore();
}
