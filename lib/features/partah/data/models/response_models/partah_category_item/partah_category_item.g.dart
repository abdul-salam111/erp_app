// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partah_category_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartahCategoryItem _$PartahCategoryItemFromJson(Map<String, dynamic> json) =>
    _PartahCategoryItem(
      log: json['Log'] == null
          ? null
          : Log.fromJson(json['Log'] as Map<String, dynamic>),
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

Map<String, dynamic> _$PartahCategoryItemToJson(_PartahCategoryItem instance) =>
    <String, dynamic>{
      'Log': instance.log,
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

_Log _$LogFromJson(Map<String, dynamic> json) => _Log(
  createdOn: json['CreatedOn'] == null
      ? null
      : DateTime.parse(json['CreatedOn'] as String),
  creator: json['Creator'] as String?,
  modifiedOn: json['ModifiedOn'] == null
      ? null
      : DateTime.parse(json['ModifiedOn'] as String),
  modifier: json['Modifier'] as String?,
);

Map<String, dynamic> _$LogToJson(_Log instance) => <String, dynamic>{
  'CreatedOn': instance.createdOn?.toIso8601String(),
  'Creator': instance.creator,
  'ModifiedOn': instance.modifiedOn?.toIso8601String(),
  'Modifier': instance.modifier,
};
