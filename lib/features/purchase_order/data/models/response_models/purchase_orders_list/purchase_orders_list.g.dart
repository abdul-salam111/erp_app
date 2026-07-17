// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_orders_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseOrdersList _$PurchaseOrdersListFromJson(Map<String, dynamic> json) =>
    _PurchaseOrdersList(
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchaseOrdersListToJson(_PurchaseOrdersList instance) =>
    <String, dynamic>{'Data': instance.data};

_Datum _$DatumFromJson(Map<String, dynamic> json) => _Datum(
  id: (json['Id'] as num?)?.toInt(),
  party: json['Party'] == null
      ? null
      : Party.fromJson(json['Party'] as Map<String, dynamic>),
  firstRow: json['FirstRow'] == null
      ? null
      : FirstRow.fromJson(json['FirstRow'] as Map<String, dynamic>),
  docDate: json['DocDate'] == null
      ? null
      : DateTime.parse(json['DocDate'] as String),
  featureId: (json['FeatureId'] as num?)?.toInt(),
  docNbr: json['DocNbr'] as String?,
  refDocNbr: json['RefDocNbr'] as String?,
  dueDate: json['DueDate'] == null
      ? null
      : DateTime.parse(json['DueDate'] as String),
  ttlSubTotal: (json['TTLSubTotal'] as num?)?.toDouble(),
  ttlTaxAmount: (json['TTLTaxAmount'] as num?)?.toDouble(),
  ttlNetAmount: (json['TTLNetAmount'] as num?)?.toDouble(),
  ttlRows: (json['TTLRows'] as num?)?.toInt(),
  ttlAttachments: (json['TTLAttachments'] as num?)?.toInt(),
  enumPrintStatusId: (json['EnumPrintStatusId'] as num?)?.toInt(),
);

Map<String, dynamic> _$DatumToJson(_Datum instance) => <String, dynamic>{
  'Id': instance.id,
  'Party': instance.party,
  'FirstRow': instance.firstRow,
  'DocDate': instance.docDate?.toIso8601String(),
  'FeatureId': instance.featureId,
  'DocNbr': instance.docNbr,
  'RefDocNbr': instance.refDocNbr,
  'DueDate': instance.dueDate?.toIso8601String(),
  'TTLSubTotal': instance.ttlSubTotal,
  'TTLTaxAmount': instance.ttlTaxAmount,
  'TTLNetAmount': instance.ttlNetAmount,
  'TTLRows': instance.ttlRows,
  'TTLAttachments': instance.ttlAttachments,
  'EnumPrintStatusId': instance.enumPrintStatusId,
};

_FirstRow _$FirstRowFromJson(Map<String, dynamic> json) =>
    _FirstRow(itemName: json['ItemName'] as String?);

Map<String, dynamic> _$FirstRowToJson(_FirstRow instance) => <String, dynamic>{
  'ItemName': instance.itemName,
};

_Party _$PartyFromJson(Map<String, dynamic> json) => _Party(
  fullName: json['FullName'] as String?,
  accountId: (json['AccountId'] as num?)?.toInt(),
);

Map<String, dynamic> _$PartyToJson(_Party instance) => <String, dynamic>{
  'FullName': instance.fullName,
  'AccountId': instance.accountId,
};
