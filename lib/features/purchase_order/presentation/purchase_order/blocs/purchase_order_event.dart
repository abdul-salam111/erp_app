import 'package:equatable/equatable.dart';

abstract class PurchaseOrderEvent extends Equatable {
  const PurchaseOrderEvent();

  @override
  List<Object?> get props => [];
}

class PurchaseOrderFetched extends PurchaseOrderEvent {
  final String fromDate;
  final String toDate;
  final String? search;

  const PurchaseOrderFetched({
    required this.fromDate,
    required this.toDate,
    this.search,
  });

  @override
  List<Object?> get props => [fromDate, toDate, search];
}
