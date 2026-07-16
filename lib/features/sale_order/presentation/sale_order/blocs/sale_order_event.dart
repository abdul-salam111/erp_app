import 'package:equatable/equatable.dart';

abstract class SaleOrderEvent extends Equatable {
  const SaleOrderEvent();

  @override
  List<Object?> get props => [];
}

class SaleOrderFetched extends SaleOrderEvent {
  final String fromDate;
  final String toDate;
  final String? search;

  const SaleOrderFetched({
    required this.fromDate,
    required this.toDate,
    this.search,
  });

  @override
  List<Object?> get props => [fromDate, toDate, search];
}
