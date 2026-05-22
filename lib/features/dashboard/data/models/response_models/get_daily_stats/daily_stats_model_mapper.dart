import '../../../../domain/entities/daily_stats_entity.dart';
import '../../../../domain/entities/order_entity.dart';
import 'daily_stats_model.dart';

extension DailyStatsModelMapper on DailyStatsModel {
  DailyStatsEntity toEntity() => DailyStatsEntity(
    ttlRecovery:       ttlRecovery       ?? 0,
    ttlReceived:       ttlReceived       ?? 0,
    ttlExpense:        ttlExpense        ?? 0,
    ttlPurchase:       ttlPurchase       ?? 0,
    ttlDuePayment:     ttlDuePayment     ?? 0,
    ttlPaid:           ttlPaid           ?? 0,
    ttlSale:           ttlSale           ?? 0,
    ttlSaleCount:      ttlSaleCount      ?? 0,
    ttlSaleOrder:      ttlSaleOrder      ?? 0,
    ttlSaleOrderCount: ttlSaleOrderCount ?? 0,
    orders: (orders ?? []).map((o) => NewOrdersEntity(
      id:           o.id           ?? 0,
      docDate:      o.docDate      ?? DateTime(0),
      docNbr:       o.docNbr       ?? '',
      partyName:    o.party?.fullName     ?? '',
      locationName: o.party?.locationName ?? '',
      ttlNetAmount: o.ttlNetAmount  ?? 0,
    )).toList(),
  );
}
