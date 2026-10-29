import '../../../../core/utils/result.dart';
import '../entities/doc_upload_request_entity.dart';

abstract interface class DocUploadRequestRepository {
  Future<Result<List<DocUploadRequestEntity>>> getDocUploadRequests({
    required bool flgCompleted,
    String? hostFeatureKey,
    int? hostEntityId,
  });

  Future<Result<DocUploadRequestEntity>> uploadDocument({
    required int id,
    required String filePath,
  });
}
