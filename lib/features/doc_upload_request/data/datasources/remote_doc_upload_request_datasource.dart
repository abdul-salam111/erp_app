import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../models/response_models/doc_upload_request_model.dart';

abstract interface class IRemoteDocUploadRequestDataSource {
  Future<List<DocUploadRequestModel>> getDocRequests({
    required bool flgCompleted,
    String? hostFeatureKey,
    int? hostEntityId,
  });

  Future<DocUploadRequestModel> uploadDocument({
    required int id,
    required String filePath,
  });
}

class RemoteDocUploadRequestDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteDocUploadRequestDataSource {
  RemoteDocUploadRequestDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<List<DocUploadRequestModel>> getDocRequests({
    required bool flgCompleted,
    String? hostFeatureKey,
    int? hostEntityId,
  }) {
    final body = <String, dynamic>{
      'FlgCompleted': flgCompleted,
      if (hostFeatureKey != null) 'HostFeatureKey': hostFeatureKey,
      if (hostEntityId != null) 'HostEntityId': hostEntityId,
    };
    return postList<DocUploadRequestModel>(
      url: ApiEndPoints.docUploadRequest.getList,
      body: body,
      parser: (json) =>
          DocUploadRequestModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<DocUploadRequestModel> uploadDocument({
    required int id,
    required String filePath,
  }) {
    return uploadFile<DocUploadRequestModel>(
      url: '${ApiEndPoints.docUploadRequest.upload}?id=$id',
      fieldName: 'File',
      filePath: filePath,
      additionalFields: {'id': id.toString()},
      parser: (json) =>
          DocUploadRequestModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }
}
