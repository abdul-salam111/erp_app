import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteOvertimeDataSource {
  Future<dynamic> performAction();
  Future<dynamic> applyOvertime(Map<String, dynamic> body);
}

class RemoteOvertimeDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteOvertimeDataSource {
  RemoteOvertimeDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.overtime.getOvertime,
      parser: (json) => json,
      body: {},
    );
  }

  @override
  Future<dynamic> applyOvertime(Map<String, dynamic> body) async {
    return post(
      url: ApiEndPoints.overtime.applyOvertime,
      parser: (json) => json,
      body: body,
    );
  }
}
