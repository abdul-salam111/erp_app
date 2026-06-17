import 'package:freezed_annotation/freezed_annotation.dart';
part 'sale_order_summary_by_party.freezed.dart';
part 'sale_order_summary_by_party.g.dart';

@freezed
abstract class SaleOrderSummaryByParty with _$SaleOrderSummaryByParty {
    const factory SaleOrderSummaryByParty({
        @JsonKey(name: "Summary") Summary? summary,
        @JsonKey(name: "CustomerOrders") List<CustomerOrder>? customerOrders,
    }) = _SaleOrderSummaryByParty;

    factory SaleOrderSummaryByParty.fromJson(Map<String, dynamic> json) => _$SaleOrderSummaryByPartyFromJson(json);
}

@freezed
abstract class Summary with _$Summary {
    const factory Summary({
        @JsonKey(name: "TTLOrders") int? ttlOrders,
        @JsonKey(name: "TTLCompletedOrders") int? ttlCompletedOrders,
        @JsonKey(name: "TTLPartialOrders") int? ttlPartialOrders,
        @JsonKey(name: "TTLNotStartedOrders") int? ttlNotStartedOrders,
    }) = _Summary;

    factory Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);
}

@freezed
abstract class CustomerOrder with _$CustomerOrder {
    const factory CustomerOrder({
        @JsonKey(name: "Id") int? id,
        @JsonKey(name: "Party") SaleOrderParty? party,
        @JsonKey(name: "DocNbr") String? docNbr,
        @JsonKey(name: "DocDate") DateTime? docDate,
        @JsonKey(name: "TTLQty") double? ttlQty,
        @JsonKey(name: "Item") SaleOrderItem? item,
        @JsonKey(name: "TTLRemainingQty") double? ttlRemainingQty,
        @JsonKey(name: "ContractMode") String? contractMode,
        @JsonKey(name: "Status") String? status,
        @JsonKey(name: "OrderWeightProgressPercentage") double? orderWeightProgressPercentage,
        @JsonKey(name: "OrderQtyProgressPercentage") double? orderQtyProgressPercentage,
        @JsonKey(name: "OrderProgressPercentage") double? orderProgressPercentage,
        @JsonKey(name: "OrderQtyRemainingPercentage") double? orderQtyRemainingPercentage,
        @JsonKey(name: "OrderWeightRemainingPercentage") double? orderWeightRemainingPercentage,
        @JsonKey(name: "OrderRemainingPercentage") double? orderRemainingPercentage,
        @JsonKey(name: "OrderQtyPercentage") double? orderQtyPercentage,
        @JsonKey(name: "OrderWeightPercentage") double? orderWeightPercentage,
    }) = _CustomerOrder;

    factory CustomerOrder.fromJson(Map<String, dynamic> json) => _$CustomerOrderFromJson(json);
}

@freezed
abstract class SaleOrderParty with _$SaleOrderParty {
    const factory SaleOrderParty({
        @JsonKey(name: "Id") int? id,
        @JsonKey(name: "FullName") String? fullName,
        @JsonKey(name: "PartyTypeId") int? partyTypeId,
        @JsonKey(name: "LocationId") int? locationId,
        @JsonKey(name: "LocationName") String? locationName,
        @JsonKey(name: "PartyTypeName") String? partyTypeName,
    }) = _SaleOrderParty;

    factory SaleOrderParty.fromJson(Map<String, dynamic> json) => _$SaleOrderPartyFromJson(json);
}

@freezed
abstract class SaleOrderItem with _$SaleOrderItem {
    const factory SaleOrderItem({
        @JsonKey(name: "Id") int? id,
        @JsonKey(name: "Name") String? name,
        @JsonKey(name: "ManufacturerId") int? manufacturerId,
        @JsonKey(name: "GroupId") int? groupId,
        @JsonKey(name: "InvAmountBasedOn") String? invAmountBasedOn,
    }) = _SaleOrderItem;

    factory SaleOrderItem.fromJson(Map<String, dynamic> json) => _$SaleOrderItemFromJson(json);
}
