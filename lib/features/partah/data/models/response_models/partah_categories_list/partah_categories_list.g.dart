// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partah_categories_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartahCategoriesList _$PartahCategoriesListFromJson(
  Map<String, dynamic> json,
) => _PartahCategoriesList(
  categories: (json['Categories'] as List<dynamic>?)
      ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList(),
  unassignedItemCount: (json['UnassignedItemCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$PartahCategoriesListToJson(
  _PartahCategoriesList instance,
) => <String, dynamic>{
  'Categories': instance.categories,
  'UnassignedItemCount': instance.unassignedItemCount,
};

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  categoryKey: json['CategoryKey'] as String?,
  displayName: json['DisplayName'] as String?,
  standardBagKg: (json['StandardBagKg'] as num?)?.toInt(),
  sortOrder: (json['SortOrder'] as num?)?.toInt(),
  isActive: json['IsActive'] as bool?,
  isRawMaterial: json['IsRawMaterial'] as bool?,
  itemCount: (json['ItemCount'] as num?)?.toInt(),
  archived: json['Archived'] as bool?,
  creatorId: (json['CreatorId'] as num?)?.toInt(),
  createdOn: json['CreatedOn'] == null
      ? null
      : DateTime.parse(json['CreatedOn'] as String),
  modifierId: (json['ModifierId'] as num?)?.toInt(),
  modifiedOn: json['ModifiedOn'] == null
      ? null
      : DateTime.parse(json['ModifiedOn'] as String),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'CategoryKey': instance.categoryKey,
  'DisplayName': instance.displayName,
  'StandardBagKg': instance.standardBagKg,
  'SortOrder': instance.sortOrder,
  'IsActive': instance.isActive,
  'IsRawMaterial': instance.isRawMaterial,
  'ItemCount': instance.itemCount,
  'Archived': instance.archived,
  'CreatorId': instance.creatorId,
  'CreatedOn': instance.createdOn?.toIso8601String(),
  'ModifierId': instance.modifierId,
  'ModifiedOn': instance.modifiedOn?.toIso8601String(),
  'Id': instance.id,
};
