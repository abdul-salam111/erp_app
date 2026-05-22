import 'package:equatable/equatable.dart';

class SaleOrderSummaryEntity extends Equatable {
  final int ttlOrders;
  final int ttlCompletedOrders;
  final int ttlPartialOrders;
  final int ttlNotStartedOrders;

  const SaleOrderSummaryEntity({
    required this.ttlOrders,
    required this.ttlCompletedOrders,
    required this.ttlPartialOrders,
    required this.ttlNotStartedOrders,
  });

  @override
  List<Object?> get props => [ttlOrders, ttlCompletedOrders, ttlPartialOrders, ttlNotStartedOrders];
}
