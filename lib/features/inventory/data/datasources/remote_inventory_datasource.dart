import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteInventoryDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteInventoryDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteInventoryDataSource {
  RemoteInventoryDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.inventory,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
