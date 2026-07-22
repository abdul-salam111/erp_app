import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/salary_mgmt_repository.dart';
import '../datasources/remote_salary_mgmt_datasource.dart';

class SalaryMgmtRepositoryImpl extends BaseRepository
    implements SalaryMgmtRepository {
  final IRemoteSalaryMgmtDataSource dataSource;

  SalaryMgmtRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> performAction() {
    return execute(call: () => dataSource.performAction());
  }
}
