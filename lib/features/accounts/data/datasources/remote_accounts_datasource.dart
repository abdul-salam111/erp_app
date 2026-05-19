import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteAccountsDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteAccountsDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteAccountsDataSource {
  RemoteAccountsDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.accounts,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
