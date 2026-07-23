import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/overtime_repository.dart';
import '../datasources/remote_overtime_datasource.dart';

class OvertimeRepositoryImpl extends BaseRepository
    implements OvertimeRepository {
  final IRemoteOvertimeDataSource dataSource;

  OvertimeRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> performAction() {
    return execute(call: () => dataSource.performAction());
  }

  @override
  Future<Result<dynamic>> applyOvertime(Map<String, dynamic> body) {
    return execute(call: () => dataSource.applyOvertime(body));
  }
}
