import '../../../../domain/entities/daily_stats_entity.dart';
import 'daily_stats_model.dart';

extension DailyStatsModelMapper on DailyStatsModel {
  DailyStatsEntity toEntity() => DailyStatsEntity(
    ttlRecovery:   ttlRecovery   ?? 0,
    ttlReceived:   ttlReceived   ?? 0,
    ttlExpense:    ttlExpense    ?? 0,
    ttlPurchase:   ttlPurchase   ?? 0,
    ttlDuePayment: ttlDuePayment ?? 0,
    ttlPaid:       ttlPaid       ?? 0,
    ttlSale:       ttlSale       ?? 0,
    ttlSaleOrder:  ttlSaleOrder  ?? 0,
  );
}
