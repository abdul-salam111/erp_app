import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/leaves_repository.dart';
import '../datasources/remote_leaves_datasource.dart';

class LeavesRepositoryImpl extends BaseRepository implements LeavesRepository {
  final IRemoteLeavesDataSource dataSource;

  LeavesRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> getLeaves() {
    return execute(call: () => dataSource.getLeaves());
  }

  @override
  Future<Result<dynamic>> applyLeave(Map<String, dynamic> body) {
    return execute(call: () => dataSource.applyLeave(body));
  }
}
