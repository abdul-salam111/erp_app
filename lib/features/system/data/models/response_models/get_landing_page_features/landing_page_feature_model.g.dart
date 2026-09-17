// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_page_feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LandingPageFeatureModel _$LandingPageFeatureModelFromJson(
  Map<String, dynamic> json,
) => _LandingPageFeatureModel(
  id: (json['Id'] as num?)?.toInt(),
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  moduleId: (json['ModuleId'] as num?)?.toInt(),
  module: json['Module'] == null
      ? null
      : LandingPageModuleModel.fromJson(json['Module'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LandingPageFeatureModelToJson(
  _LandingPageFeatureModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'SysKey': instance.sysKey,
  'ModuleId': instance.moduleId,
  'Module': instance.module,
};

_LandingPageModuleModel _$LandingPageModuleModelFromJson(
  Map<String, dynamic> json,
) => _LandingPageModuleModel(
  id: (json['Id'] as num?)?.toInt(),
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
);

Map<String, dynamic> _$LandingPageModuleModelToJson(
  _LandingPageModuleModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'SysKey': instance.sysKey,
};
