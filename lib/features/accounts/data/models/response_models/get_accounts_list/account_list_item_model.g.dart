// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountListItemModel _$AccountListItemModelFromJson(
  Map<String, dynamic> json,
) => _AccountListItemModel(
  id: (json['Id'] as num).toInt(),
  name: json['Name'] as String? ?? '',
  group: _groupName(json['AccType']),
);

Map<String, dynamic> _$AccountListItemModelToJson(
  _AccountListItemModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'AccType': instance.group,
};
