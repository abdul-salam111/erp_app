import 'package:equatable/equatable.dart';
import 'order_entity.dart';

class DailyStatsEntity extends Equatable {
  final double           ttlRecovery;
  final double           ttlReceived;
  final double           ttlExpense;
  final double           ttlPurchase;
  final double           ttlDuePayment;
  final double           ttlPaid;
  final double           ttlSale;
  final double           ttlSaleCount;
  final double           ttlSaleOrder;
  final double           ttlSaleOrderCount;
  final List<NewOrdersEntity> orders;

  const DailyStatsEntity({
    required this.ttlRecovery,
    required this.ttlReceived,
    required this.ttlExpense,
    required this.ttlPurchase,
    required this.ttlDuePayment,
    required this.ttlPaid,
    required this.ttlSale,
    required this.ttlSaleCount,
    required this.ttlSaleOrder,
    required this.ttlSaleOrderCount,
    required this.orders,
  });

  @override
  List<Object?> get props => [
    ttlRecovery, ttlReceived, ttlExpense, ttlPurchase,
    ttlDuePayment, ttlPaid, ttlSale, ttlSaleCount,
    ttlSaleOrder, ttlSaleOrderCount, orders,
  ];
}
