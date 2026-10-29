import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/doc_upload_request_entity.dart';
import '../repositories/doc_upload_request_repository.dart';

class GetDocUploadRequestsParams {
  final bool flgCompleted;
  final String? hostFeatureKey;
  final int? hostEntityId;

  const GetDocUploadRequestsParams({
    required this.flgCompleted,
    this.hostFeatureKey,
    this.hostEntityId,
  });
}

class GetDocUploadRequestsUsecase
    implements
        Usecase<List<DocUploadRequestEntity>, GetDocUploadRequestsParams> {
  final DocUploadRequestRepository repository;

  const GetDocUploadRequestsUsecase({required this.repository});

  @override
  Future<Result<List<DocUploadRequestEntity>>> call(
    GetDocUploadRequestsParams params,
  ) {
    return repository.getDocUploadRequests(
      flgCompleted: params.flgCompleted,
      hostFeatureKey: params.hostFeatureKey,
      hostEntityId: params.hostEntityId,
    );
  }
}
