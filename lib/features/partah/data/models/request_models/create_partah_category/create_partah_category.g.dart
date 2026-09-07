// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_partah_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePartahCategory _$CreatePartahCategoryFromJson(
  Map<String, dynamic> json,
) => _CreatePartahCategory(
  id: (json['Id'] as num?)?.toInt(),
  categoryKey: json['CategoryKey'] as String?,
  displayName: json['DisplayName'] as String?,
  isActive: json['IsActive'] as bool?,
  isRawMaterial: json['IsRawMaterial'] as bool?,
  sortOrder: (json['SortOrder'] as num?)?.toInt(),
  standardBagKg: (json['StandardBagKg'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreatePartahCategoryToJson(
  _CreatePartahCategory instance,
) => <String, dynamic>{
  'Id': instance.id,
  'CategoryKey': instance.categoryKey,
  'DisplayName': instance.displayName,
  'IsActive': instance.isActive,
  'IsRawMaterial': instance.isRawMaterial,
  'SortOrder': instance.sortOrder,
  'StandardBagKg': instance.standardBagKg,
};
