import 'package:equatable/equatable.dart';

class SaleOrderRow extends Equatable {
  final String    party;
  final String    docNbr;
  final DateTime? docDate;
  final String    item;
  final String    status;
  final int       ttlQty;
  final int       ttlRemainingQty;
  final int       progress;

  const SaleOrderRow({
    required this.party,
    required this.docNbr,
    this.docDate,
    required this.item,
    required this.status,
    required this.ttlQty,
    required this.ttlRemainingQty,
    required this.progress,
  });

  @override
  List<Object?> get props => [party, docNbr, docDate, item, status, ttlQty, ttlRemainingQty, progress];
}

class SaleOrderSummaryEntity extends Equatable {
  final int                ttlOrders;
  final int                ttlCompletedOrders;
  final int                ttlPartialOrders;
  final int                ttlNotStartedOrders;
  final List<SaleOrderRow> orders;

  const SaleOrderSummaryEntity({
    required this.ttlOrders,
    required this.ttlCompletedOrders,
    required this.ttlPartialOrders,
    required this.ttlNotStartedOrders,
    this.orders = const [],
  });

  @override
  List<Object?> get props => [ttlOrders, ttlCompletedOrders, ttlPartialOrders, ttlNotStartedOrders, orders];
}
