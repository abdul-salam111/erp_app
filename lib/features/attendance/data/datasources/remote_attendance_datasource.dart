import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteAttendanceDataSource {
  Future<dynamic> getMonth({required int year, required int month});
}

class RemoteAttendanceDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteAttendanceDataSource {
  RemoteAttendanceDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> getMonth({required int year, required int month}) async {
    return post(
      url: ApiEndPoints.attendance.getMonth,
      body: {
        'Year': year,
        'Month': month,
      },
      parser: (json) => json,
    );
  }
}
