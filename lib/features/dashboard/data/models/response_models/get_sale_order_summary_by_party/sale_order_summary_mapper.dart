import '../../../../domain/entities/sale_order_summary_entity.dart';
import 'sale_order_summary_by_party.dart';

extension SaleOrderSummaryMapper on SaleOrderSummaryByParty {
  SaleOrderSummaryEntity toEntity() => SaleOrderSummaryEntity(
    ttlOrders:           summary?.ttlOrders           ?? 0,
    ttlCompletedOrders:  summary?.ttlCompletedOrders  ?? 0,
    ttlPartialOrders:    summary?.ttlPartialOrders     ?? 0,
    ttlNotStartedOrders: summary?.ttlNotStartedOrders  ?? 0,
    orders: customerOrders?.map((o) => SaleOrderRow(
      party:           o.party?.fullName          ?? '',
      docNbr:          o.docNbr                   ?? '',
      docDate:         o.docDate,
      item:            o.item?.name               ?? '',
      status:          o.status                   ?? '',
      ttlQty:          o.ttlQty                   ?? 0,
      ttlRemainingQty: o.ttlRemainingQty           ?? 0,
      progress:        o.orderProgressPercentage   ?? 0,
    )).toList() ?? const [],
  );
}
