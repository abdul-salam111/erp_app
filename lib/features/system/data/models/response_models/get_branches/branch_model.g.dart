// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => _BranchModel(
  id: (json['Id'] as num?)?.toInt(),
  name: json['Name'] as String?,
  misOrganizationId: (json['MisOrganizationId'] as num?)?.toInt(),
  locationId: (json['LocationId'] as num?)?.toInt(),
  archived: json['Archived'] as bool?,
);

Map<String, dynamic> _$BranchModelToJson(_BranchModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'MisOrganizationId': instance.misOrganizationId,
      'LocationId': instance.locationId,
      'Archived': instance.archived,
    };
