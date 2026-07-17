// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_orders_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleOrdersList _$SaleOrdersListFromJson(Map<String, dynamic> json) =>
    _SaleOrdersList(
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => SaleOrderDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleOrdersListToJson(_SaleOrdersList instance) =>
    <String, dynamic>{'Data': instance.data};

_SaleOrderDatum _$SaleOrderDatumFromJson(Map<String, dynamic> json) =>
    _SaleOrderDatum(
      id: (json['Id'] as num?)?.toInt(),
      party: json['Party'] == null
          ? null
          : SaleOrderParty.fromJson(json['Party'] as Map<String, dynamic>),
      firstRow: json['FirstRow'] == null
          ? null
          : SaleOrderFirstRow.fromJson(
              json['FirstRow'] as Map<String, dynamic>,
            ),
      docDate: json['DocDate'] == null
          ? null
          : DateTime.parse(json['DocDate'] as String),
      docNbr: json['DocNbr'] as String?,
      refDocNbr: json['RefDocNbr'] as String?,
      ttlNetAmount: (json['TTLNetAmount'] as num?)?.toDouble(),
      ttlRows: (json['TTLRows'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SaleOrderDatumToJson(_SaleOrderDatum instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Party': instance.party,
      'FirstRow': instance.firstRow,
      'DocDate': instance.docDate?.toIso8601String(),
      'DocNbr': instance.docNbr,
      'RefDocNbr': instance.refDocNbr,
      'TTLNetAmount': instance.ttlNetAmount,
      'TTLRows': instance.ttlRows,
    };

_SaleOrderFirstRow _$SaleOrderFirstRowFromJson(Map<String, dynamic> json) =>
    _SaleOrderFirstRow(itemName: json['ItemName'] as String?);

Map<String, dynamic> _$SaleOrderFirstRowToJson(_SaleOrderFirstRow instance) =>
    <String, dynamic>{'ItemName': instance.itemName};

_SaleOrderParty _$SaleOrderPartyFromJson(Map<String, dynamic> json) =>
    _SaleOrderParty(
      fullName: json['FullName'] as String?,
      accountId: (json['AccountId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SaleOrderPartyToJson(_SaleOrderParty instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'AccountId': instance.accountId,
    };
