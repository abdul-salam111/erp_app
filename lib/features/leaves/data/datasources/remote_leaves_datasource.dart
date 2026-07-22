import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteLeavesDataSource {
  Future<dynamic> getLeaves();
}

class RemoteLeavesDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteLeavesDataSource {
  RemoteLeavesDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> getLeaves() async {
    return get(
      url: ApiEndPoints.leaves.getLeaves,
      parser: (json) => json,
    );
  }
}
