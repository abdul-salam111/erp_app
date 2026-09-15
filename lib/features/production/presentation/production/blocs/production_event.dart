import 'package:equatable/equatable.dart';

abstract class ProductionEvent extends Equatable {
  const ProductionEvent();

  @override
  List<Object?> get props => [];
}

class ProductionFetched extends ProductionEvent {
  const ProductionFetched();
}

class ProductionSearchChanged extends ProductionEvent {
  final String query;

  const ProductionSearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class ProductionLoadMore extends ProductionEvent {
  const ProductionLoadMore();
}

class ProductionSubmitted extends ProductionEvent {}
