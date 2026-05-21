import 'package:freezed_annotation/freezed_annotation.dart';
part 'daily_stats_model.freezed.dart';
part 'daily_stats_model.g.dart';

@freezed
abstract class DailyStatsModel with _$DailyStatsModel {
    const factory DailyStatsModel({
        @JsonKey(name: "TTLRecovery")
        int? ttlRecovery,
        @JsonKey(name: "TTLReceived")
        int? ttlReceived,
        @JsonKey(name: "TTLExpense")
        int? ttlExpense,
        @JsonKey(name: "TTLPurchase")
        int? ttlPurchase,
        @JsonKey(name: "TTLDuePayment")
        int? ttlDuePayment,
        @JsonKey(name: "TTLPaid")
        int? ttlPaid,
        @JsonKey(name: "TTLSale")
        int? ttlSale,
        @JsonKey(name: "TTLSaleCount")
        int? ttlSaleCount,
        @JsonKey(name: "TTLSaleOrder")
        int? ttlSaleOrder,
        @JsonKey(name: "TTLSaleOrderCount")
        int? ttlSaleOrderCount,
        @JsonKey(name: "Orders")
        List<dynamic>? orders,
        @JsonKey(name: "Stocks")
        List<dynamic>? stocks,
    }) = _DailyStatsModel;

    factory DailyStatsModel.fromJson(Map<String, dynamic> json) => _$DailyStatsModelFromJson(json);
}
