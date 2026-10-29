// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_upload_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocUploadRequestModel _$DocUploadRequestModelFromJson(
  Map<String, dynamic> json,
) => _DocUploadRequestModel(
  id: (json['Id'] as num).toInt(),
  purpose: json['Purpose'] as String? ?? '',
  hostFeatureId: (json['HostFeatureId'] as num).toInt(),
  hostEntityId: (json['HostEntityId'] as num).toInt(),
  flgCompleted: json['FlgCompleted'] as bool,
  hostFeatureName: json['HostFeatureName'] as String? ?? '',
  hostFeatureKey: json['HostFeatureKey'] as String? ?? '',
  completedOn: json['CompletedOn'] == null
      ? null
      : DateTime.parse(json['CompletedOn'] as String),
);

Map<String, dynamic> _$DocUploadRequestModelToJson(
  _DocUploadRequestModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Purpose': instance.purpose,
  'HostFeatureId': instance.hostFeatureId,
  'HostEntityId': instance.hostEntityId,
  'FlgCompleted': instance.flgCompleted,
  'HostFeatureName': instance.hostFeatureName,
  'HostFeatureKey': instance.hostFeatureKey,
  'CompletedOn': instance.completedOn?.toIso8601String(),
};
