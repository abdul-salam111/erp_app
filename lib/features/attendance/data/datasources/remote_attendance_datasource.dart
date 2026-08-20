import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteAttendanceDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteAttendanceDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteAttendanceDataSource {
  RemoteAttendanceDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.attendance.getAttendance,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
