import '../../domain/entities/doc_upload_request_entity.dart';
import '../models/response_models/doc_upload_request_model.dart';

extension DocUploadRequestModelX on DocUploadRequestModel {
  DocUploadRequestEntity toEntity() => DocUploadRequestEntity(
    id: id,
    purpose: purpose,
    hostFeatureId: hostFeatureId,
    hostEntityId: hostEntityId,
    flgCompleted: flgCompleted,
    hostFeatureName: hostFeatureName,
    hostFeatureKey: hostFeatureKey,
    completedOn: completedOn,
  );
}
