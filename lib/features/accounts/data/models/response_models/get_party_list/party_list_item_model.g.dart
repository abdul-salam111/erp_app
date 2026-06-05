// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartyListItemModel _$PartyListItemModelFromJson(Map<String, dynamic> json) =>
    _PartyListItemModel(
      id: (json['Id'] as num).toInt(),
      name: json['FullName'] as String? ?? '',
      partyType: _partyTypeName(json['PartyType']),
    );

Map<String, dynamic> _$PartyListItemModelToJson(_PartyListItemModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'FullName': instance.name,
      'PartyType': instance.partyType,
    };
