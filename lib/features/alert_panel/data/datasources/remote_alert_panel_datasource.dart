import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteAlertPanelDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteAlertPanelDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteAlertPanelDataSource {
  RemoteAlertPanelDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.alertPanel,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
