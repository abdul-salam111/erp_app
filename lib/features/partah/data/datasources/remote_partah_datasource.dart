import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemotePartahDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemotePartahDataSourceImpl extends BaseRemoteDatasource
    implements IRemotePartahDataSource {
  RemotePartahDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.partah.performAction,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
