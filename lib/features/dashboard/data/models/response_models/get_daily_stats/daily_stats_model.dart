import 'package:freezed_annotation/freezed_annotation.dart';
part 'daily_stats_model.freezed.dart';
part 'daily_stats_model.g.dart';

@freezed
abstract class DailyStatsModel with _$DailyStatsModel {
    const factory DailyStatsModel({
        @JsonKey(name: "TTLRecovery")
        double? ttlRecovery,
        @JsonKey(name: "TTLReceived")
        double? ttlReceived,
        @JsonKey(name: "TTLExpense")
        double? ttlExpense,
        @JsonKey(name: "TTLPurchase")
        double? ttlPurchase,
        @JsonKey(name: "TTLDuePayment")
        double? ttlDuePayment,
        @JsonKey(name: "TTLPaid")
        double? ttlPaid,
        @JsonKey(name: "TTLSale")
        double? ttlSale,
        @JsonKey(name: "TTLSaleCount")
        double? ttlSaleCount,
        @JsonKey(name: "TTLSaleOrder")
        double? ttlSaleOrder,
        @JsonKey(name: "TTLSaleOrderCount")
        double? ttlSaleOrderCount,
        @JsonKey(name: "Orders")
        List<Order>? orders,
    }) = _DailyStatsModel;

    factory DailyStatsModel.fromJson(Map<String, dynamic> json) => _$DailyStatsModelFromJson(json);
}

@freezed
abstract class Order with _$Order {
    const factory Order({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "DocDate")
        DateTime? docDate,
        @JsonKey(name: "DocNbr")
        String? docNbr,
        @JsonKey(name: "Party")
        Party? party,
        @JsonKey(name: "TTLNetAmount")
        double? ttlNetAmount,
    }) = _Order;

    factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
abstract class Party with _$Party {
    const factory Party({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "FullName")
        String? fullName,
        @JsonKey(name: "PartyTypeId")
        int? partyTypeId,
        @JsonKey(name: "LocationId")
        int? locationId,
        @JsonKey(name: "LocationName")
        String? locationName,
        @JsonKey(name: "PartyTypeName")
        String? partyTypeName,
    }) = _Party;

    factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);
}
