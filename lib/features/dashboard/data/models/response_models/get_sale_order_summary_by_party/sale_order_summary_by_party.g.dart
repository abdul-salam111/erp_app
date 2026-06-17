// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_order_summary_by_party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleOrderSummaryByParty _$SaleOrderSummaryByPartyFromJson(
  Map<String, dynamic> json,
) => _SaleOrderSummaryByParty(
  summary: json['Summary'] == null
      ? null
      : Summary.fromJson(json['Summary'] as Map<String, dynamic>),
  customerOrders: (json['CustomerOrders'] as List<dynamic>?)
      ?.map((e) => CustomerOrder.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SaleOrderSummaryByPartyToJson(
  _SaleOrderSummaryByParty instance,
) => <String, dynamic>{
  'Summary': instance.summary,
  'CustomerOrders': instance.customerOrders,
};

_Summary _$SummaryFromJson(Map<String, dynamic> json) => _Summary(
  ttlOrders: (json['TTLOrders'] as num?)?.toInt(),
  ttlCompletedOrders: (json['TTLCompletedOrders'] as num?)?.toInt(),
  ttlPartialOrders: (json['TTLPartialOrders'] as num?)?.toInt(),
  ttlNotStartedOrders: (json['TTLNotStartedOrders'] as num?)?.toInt(),
);

Map<String, dynamic> _$SummaryToJson(_Summary instance) => <String, dynamic>{
  'TTLOrders': instance.ttlOrders,
  'TTLCompletedOrders': instance.ttlCompletedOrders,
  'TTLPartialOrders': instance.ttlPartialOrders,
  'TTLNotStartedOrders': instance.ttlNotStartedOrders,
};

_CustomerOrder _$CustomerOrderFromJson(Map<String, dynamic> json) =>
    _CustomerOrder(
      id: (json['Id'] as num?)?.toInt(),
      party: json['Party'] == null
          ? null
          : SaleOrderParty.fromJson(json['Party'] as Map<String, dynamic>),
      docNbr: json['DocNbr'] as String?,
      docDate: json['DocDate'] == null
          ? null
          : DateTime.parse(json['DocDate'] as String),
      ttlQty: (json['TTLQty'] as num?)?.toDouble(),
      item: json['Item'] == null
          ? null
          : SaleOrderItem.fromJson(json['Item'] as Map<String, dynamic>),
      ttlRemainingQty: (json['TTLRemainingQty'] as num?)?.toDouble(),
      contractMode: json['ContractMode'] as String?,
      status: json['Status'] as String?,
      orderWeightProgressPercentage:
          (json['OrderWeightProgressPercentage'] as num?)?.toDouble(),
      orderQtyProgressPercentage: (json['OrderQtyProgressPercentage'] as num?)
          ?.toDouble(),
      orderProgressPercentage: (json['OrderProgressPercentage'] as num?)
          ?.toDouble(),
      orderQtyRemainingPercentage: (json['OrderQtyRemainingPercentage'] as num?)
          ?.toDouble(),
      orderWeightRemainingPercentage:
          (json['OrderWeightRemainingPercentage'] as num?)?.toDouble(),
      orderRemainingPercentage: (json['OrderRemainingPercentage'] as num?)
          ?.toDouble(),
      orderQtyPercentage: (json['OrderQtyPercentage'] as num?)?.toDouble(),
      orderWeightPercentage: (json['OrderWeightPercentage'] as num?)
          ?.toDouble(),
    );

Map<String, dynamic> _$CustomerOrderToJson(_CustomerOrder instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Party': instance.party,
      'DocNbr': instance.docNbr,
      'DocDate': instance.docDate?.toIso8601String(),
      'TTLQty': instance.ttlQty,
      'Item': instance.item,
      'TTLRemainingQty': instance.ttlRemainingQty,
      'ContractMode': instance.contractMode,
      'Status': instance.status,
      'OrderWeightProgressPercentage': instance.orderWeightProgressPercentage,
      'OrderQtyProgressPercentage': instance.orderQtyProgressPercentage,
      'OrderProgressPercentage': instance.orderProgressPercentage,
      'OrderQtyRemainingPercentage': instance.orderQtyRemainingPercentage,
      'OrderWeightRemainingPercentage': instance.orderWeightRemainingPercentage,
      'OrderRemainingPercentage': instance.orderRemainingPercentage,
      'OrderQtyPercentage': instance.orderQtyPercentage,
      'OrderWeightPercentage': instance.orderWeightPercentage,
    };

_SaleOrderParty _$SaleOrderPartyFromJson(Map<String, dynamic> json) =>
    _SaleOrderParty(
      id: (json['Id'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      partyTypeId: (json['PartyTypeId'] as num?)?.toInt(),
      locationId: (json['LocationId'] as num?)?.toInt(),
      locationName: json['LocationName'] as String?,
      partyTypeName: json['PartyTypeName'] as String?,
    );

Map<String, dynamic> _$SaleOrderPartyToJson(_SaleOrderParty instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'FullName': instance.fullName,
      'PartyTypeId': instance.partyTypeId,
      'LocationId': instance.locationId,
      'LocationName': instance.locationName,
      'PartyTypeName': instance.partyTypeName,
    };

_SaleOrderItem _$SaleOrderItemFromJson(Map<String, dynamic> json) =>
    _SaleOrderItem(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      manufacturerId: (json['ManufacturerId'] as num?)?.toInt(),
      groupId: (json['GroupId'] as num?)?.toInt(),
      invAmountBasedOn: json['InvAmountBasedOn'] as String?,
    );

Map<String, dynamic> _$SaleOrderItemToJson(_SaleOrderItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'ManufacturerId': instance.manufacturerId,
      'GroupId': instance.groupId,
      'InvAmountBasedOn': instance.invAmountBasedOn,
    };
