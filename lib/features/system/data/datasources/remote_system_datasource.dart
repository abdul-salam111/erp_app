import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteSystemDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteSystemDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteSystemDataSource {
  RemoteSystemDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.accounts.accountLedger,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
