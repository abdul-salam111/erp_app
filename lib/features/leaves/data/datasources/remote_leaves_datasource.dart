import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteLeavesDataSource {
  Future<dynamic> getLeaves();
  Future<dynamic> applyLeave(Map<String, dynamic> body);
  Future<dynamic> getBalances();
  Future<dynamic> getById(int id);
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

  @override
  Future<dynamic> applyLeave(Map<String, dynamic> body) async {
    return post(
      url: ApiEndPoints.leaves.applyLeave,
      body: body,
      parser: (json) => json,
    );
  }

  @override
  Future<dynamic> getBalances() async {
    return post(
      url: ApiEndPoints.leaves.getBalances,
      body: const {},
      parser: (json) => json,
    );
  }

  @override
  Future<dynamic> getById(int id) async {
    return post(
      url: ApiEndPoints.leaves.getById,
      body: {'Id': id},
      parser: (json) => json,
    );
  }
}
