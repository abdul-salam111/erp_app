import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/loan_and_advance_repository.dart';
import '../datasources/remote_loan_and_advance_datasource.dart';

class LoanAndAdvanceRepositoryImpl extends BaseRepository
    implements LoanAndAdvanceRepository {
  final IRemoteLoanAndAdvanceDataSource dataSource;

  LoanAndAdvanceRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> performAction() {
    return execute(call: () => dataSource.performAction());
  }
}
