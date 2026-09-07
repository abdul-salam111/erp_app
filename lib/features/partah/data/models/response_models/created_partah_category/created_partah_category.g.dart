// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_partah_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatedPartahCategory _$CreatedPartahCategoryFromJson(
  Map<String, dynamic> json,
) => _CreatedPartahCategory(
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
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreatedPartahCategoryToJson(
  _CreatedPartahCategory instance,
) => <String, dynamic>{
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
  'Id': instance.id,
};

_Log _$LogFromJson(Map<String, dynamic> json) => _Log(
  createdOn: json['CreatedOn'] == null
      ? null
      : DateTime.parse(json['CreatedOn'] as String),
  creator: json['Creator'] as String?,
);

Map<String, dynamic> _$LogToJson(_Log instance) => <String, dynamic>{
  'CreatedOn': instance.createdOn?.toIso8601String(),
  'Creator': instance.creator,
};
