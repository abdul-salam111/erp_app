import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/doc_upload_request_entity.dart';
import '../repositories/doc_upload_request_repository.dart';

class UploadDocumentParams {
  final int id;
  final List<String> filePaths;

  const UploadDocumentParams({required this.id, required this.filePaths});
}

class UploadDocumentUsecase
    implements Usecase<DocUploadRequestEntity, UploadDocumentParams> {
  final DocUploadRequestRepository repository;

  const UploadDocumentUsecase({required this.repository});

  @override
  Future<Result<DocUploadRequestEntity>> call(UploadDocumentParams params) {
    return repository.uploadDocument(
      id: params.id,
      filePaths: params.filePaths,
    );
  }
}
