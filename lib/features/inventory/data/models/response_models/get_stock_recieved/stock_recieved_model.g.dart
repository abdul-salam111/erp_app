// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_recieved_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockRecievedModel _$StockRecievedModelFromJson(Map<String, dynamic> json) =>
    _StockRecievedModel(
      partyId: (json['PartyId'] as num?)?.toInt(),
      party: json['Party'] == null
          ? null
          : Party.fromJson(json['Party'] as Map<String, dynamic>),
      itemId: (json['ItemId'] as num?)?.toInt(),
      item: json['Item'] == null
          ? null
          : StockReceivedItem.fromJson(json['Item'] as Map<String, dynamic>),
      itemCount: (json['ItemCount'] as num?)?.toInt(),
      qty: (json['Qty'] as num?)?.toDouble(),
      weight: (json['Weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockRecievedModelToJson(_StockRecievedModel instance) =>
    <String, dynamic>{
      'PartyId': instance.partyId,
      'Party': instance.party,
      'ItemId': instance.itemId,
      'Item': instance.item,
      'ItemCount': instance.itemCount,
      'Qty': instance.qty,
      'Weight': instance.weight,
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

_StockReceivedItem _$StockReceivedItemFromJson(Map<String, dynamic> json) =>
    _StockReceivedItem(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      manufacturerId: (json['ManufacturerId'] as num?)?.toInt(),
      groupId: (json['GroupId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StockReceivedItemToJson(_StockReceivedItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'ManufacturerId': instance.manufacturerId,
      'GroupId': instance.groupId,
    };
