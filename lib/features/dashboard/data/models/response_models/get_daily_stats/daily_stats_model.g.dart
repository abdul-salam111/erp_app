// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyStatsModel _$DailyStatsModelFromJson(Map<String, dynamic> json) =>
    _DailyStatsModel(
      ttlRecovery: (json['TTLRecovery'] as num?)?.toDouble(),
      ttlReceived: (json['TTLReceived'] as num?)?.toDouble(),
      ttlExpense: (json['TTLExpense'] as num?)?.toDouble(),
      ttlPurchase: (json['TTLPurchase'] as num?)?.toDouble(),
      ttlDuePayment: (json['TTLDuePayment'] as num?)?.toDouble(),
      ttlPaid: (json['TTLPaid'] as num?)?.toDouble(),
      ttlSale: (json['TTLSale'] as num?)?.toDouble(),
      ttlSaleCount: (json['TTLSaleCount'] as num?)?.toDouble(),
      ttlSaleOrder: (json['TTLSaleOrder'] as num?)?.toDouble(),
      ttlSaleOrderCount: (json['TTLSaleOrderCount'] as num?)?.toDouble(),
      orders: (json['Orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    };

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: (json['Id'] as num?)?.toInt(),
  docDate: json['DocDate'] == null
      ? null
      : DateTime.parse(json['DocDate'] as String),
  docNbr: json['DocNbr'] as String?,
  party: json['Party'] == null
      ? null
      : Party.fromJson(json['Party'] as Map<String, dynamic>),
  ttlNetAmount: (json['TTLNetAmount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'Id': instance.id,
  'DocDate': instance.docDate?.toIso8601String(),
  'DocNbr': instance.docNbr,
  'Party': instance.party,
  'TTLNetAmount': instance.ttlNetAmount,
};

_Party _$PartyFromJson(Map<String, dynamic> json) => _Party(
  id: (json['Id'] as num?)?.toInt(),
  fullName: json['FullName'] as String?,
  partyTypeId: (json['PartyTypeId'] as num?)?.toInt(),
  locationId: (json['LocationId'] as num?)?.toInt(),
  locationName: json['LocationName'] as String?,
  partyTypeName: json['PartyTypeName'] as String?,
);

Map<String, dynamic> _$PartyToJson(_Party instance) => <String, dynamic>{
  'Id': instance.id,
  'FullName': instance.fullName,
  'PartyTypeId': instance.partyTypeId,
  'LocationId': instance.locationId,
  'LocationName': instance.locationName,
  'PartyTypeName': instance.partyTypeName,
};
