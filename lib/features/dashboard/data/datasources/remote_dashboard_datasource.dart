import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteDashboardDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteDashboardDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteDashboardDataSource {
  RemoteDashboardDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.dashboard,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
