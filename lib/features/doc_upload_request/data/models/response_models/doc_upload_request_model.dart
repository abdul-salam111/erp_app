import 'package:freezed_annotation/freezed_annotation.dart';

part 'doc_upload_request_model.freezed.dart';
part 'doc_upload_request_model.g.dart';

@freezed
abstract class DocUploadRequestModel with _$DocUploadRequestModel {
  const factory DocUploadRequestModel({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'Purpose', defaultValue: '') required String purpose,
    @JsonKey(name: 'HostFeatureId') required int hostFeatureId,
    @JsonKey(name: 'HostEntityId') required int hostEntityId,
    @JsonKey(name: 'FlgCompleted') required bool flgCompleted,
    @JsonKey(name: 'HostFeatureName', defaultValue: '')
    required String hostFeatureName,
    @JsonKey(name: 'HostFeatureKey', defaultValue: '')
    required String hostFeatureKey,
    @JsonKey(name: 'CompletedOn') DateTime? completedOn,
  }) = _DocUploadRequestModel;

  factory DocUploadRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DocUploadRequestModelFromJson(json);
}
