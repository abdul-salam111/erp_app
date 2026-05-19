import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteAnalyticsDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteAnalyticsDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteAnalyticsDataSource {
  RemoteAnalyticsDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.analytics,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
