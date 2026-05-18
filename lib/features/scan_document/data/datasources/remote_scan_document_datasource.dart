import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteScanDocumentDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteScanDocumentDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteScanDocumentDataSource {
  RemoteScanDocumentDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.scanDocument,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
