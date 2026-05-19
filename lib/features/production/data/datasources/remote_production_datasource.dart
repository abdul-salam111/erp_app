import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteProductionDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteProductionDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteProductionDataSource {
  RemoteProductionDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.production,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
