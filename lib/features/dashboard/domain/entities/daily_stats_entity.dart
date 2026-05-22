import 'package:equatable/equatable.dart';

class DailyStatsEntity extends Equatable {
  final int ttlRecovery;
  final int ttlReceived;
  final int ttlExpense;
  final int ttlPurchase;
  final int ttlDuePayment;
  final int ttlPaid;
  final int ttlSale;
  final int ttlSaleOrder;

  const DailyStatsEntity({
    required this.ttlRecovery,
    required this.ttlReceived,
    required this.ttlExpense,
    required this.ttlPurchase,
    required this.ttlDuePayment,
    required this.ttlPaid,
    required this.ttlSale,
    required this.ttlSaleOrder,
  });

  @override
  List<Object?> get props => [
    ttlRecovery, ttlReceived, ttlExpense, ttlPurchase,
    ttlDuePayment, ttlPaid, ttlSale, ttlSaleOrder,
  ];
}
