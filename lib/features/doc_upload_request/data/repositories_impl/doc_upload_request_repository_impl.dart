import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/doc_upload_request_entity.dart';
import '../../domain/repositories/doc_upload_request_repository.dart';
import '../datasources/remote_doc_upload_request_datasource.dart';
import '../mappers/doc_upload_request_mappers.dart';

class DocUploadRequestRepositoryImpl extends BaseRepository
    implements DocUploadRequestRepository {
  final IRemoteDocUploadRequestDataSource dataSource;

  DocUploadRequestRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<DocUploadRequestEntity>>> getDocUploadRequests({
    required bool flgCompleted,
    String? hostFeatureKey,
    int? hostEntityId,
  }) async {
    final result = await execute(
      call: () => dataSource.getDocRequests(
        flgCompleted: flgCompleted,
        hostFeatureKey: hostFeatureKey,
        hostEntityId: hostEntityId,
      ),
    );
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Result<DocUploadRequestEntity>> uploadDocument({
    required int id,
    required List<String> filePaths,
  }) async {
    final result = await execute(
      call: () => dataSource.uploadDocument(id: id, filePaths: filePaths),
    );
    return result.map((model) => model.toEntity());
  }
}
