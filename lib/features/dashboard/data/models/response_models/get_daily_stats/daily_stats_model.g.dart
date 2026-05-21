// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyStatsModel _$DailyStatsModelFromJson(Map<String, dynamic> json) =>
    _DailyStatsModel(
      ttlRecovery: (json['TTLRecovery'] as num?)?.toInt(),
      ttlReceived: (json['TTLReceived'] as num?)?.toInt(),
      ttlExpense: (json['TTLExpense'] as num?)?.toInt(),
      ttlPurchase: (json['TTLPurchase'] as num?)?.toInt(),
      ttlDuePayment: (json['TTLDuePayment'] as num?)?.toInt(),
      ttlPaid: (json['TTLPaid'] as num?)?.toInt(),
      ttlSale: (json['TTLSale'] as num?)?.toInt(),
      ttlSaleCount: (json['TTLSaleCount'] as num?)?.toInt(),
      ttlSaleOrder: (json['TTLSaleOrder'] as num?)?.toInt(),
      ttlSaleOrderCount: (json['TTLSaleOrderCount'] as num?)?.toInt(),
      orders: json['Orders'] as List<dynamic>?,
      stocks: json['Stocks'] as List<dynamic>?,
    );

Map<String, dynamic> _$DailyStatsModelToJson(_DailyStatsModel instance) =>
    <String, dynamic>{
      'TTLRecovery': instance.ttlRecovery,
      'TTLReceived': instance.ttlReceived,
      'TTLExpense': instance.ttlExpense,
      'TTLPurchase': instance.ttlPurchase,
      'TTLDuePayment': instance.ttlDuePayment,
      'TTLPaid': instance.ttlPaid,
      'TTLSale': instance.ttlSale,
      'TTLSaleCount': instance.ttlSaleCount,
      'TTLSaleOrder': instance.ttlSaleOrder,
      'TTLSaleOrderCount': instance.ttlSaleOrderCount,
      'Orders': instance.orders,
      'Stocks': instance.stocks,
    };
