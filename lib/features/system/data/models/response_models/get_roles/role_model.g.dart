// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => _RoleModel(
  id: (json['Id'] as num?)?.toInt(),
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  description: json['Description'] as String?,
  flgSystem: json['FlgSystem'] as bool?,
  misOrganizationId: (json['MisOrganizationId'] as num?)?.toInt(),
  totalUsers: (json['TTLUsers'] as num?)?.toInt(),
  archived: json['Archived'] as bool?,
);

Map<String, dynamic> _$RoleModelToJson(_RoleModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'SysKey': instance.sysKey,
      'Description': instance.description,
      'FlgSystem': instance.flgSystem,
      'MisOrganizationId': instance.misOrganizationId,
      'TTLUsers': instance.totalUsers,
      'Archived': instance.archived,
    };
