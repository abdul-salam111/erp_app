import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../entities/shared/ledger_statement_entity.dart';
import '../../repositories/i_accounts_repository.dart';

class GetCashbookStatementsParams {
  final String fromDate;
  final String toDate;
  final int? accountId;

  const GetCashbookStatementsParams({
    required this.fromDate,
    required this.toDate,
    this.accountId,
  });
}

class GetCashbookStatementsUsecase
    implements
        Usecase<List<LedgerStatementEntity>, GetCashbookStatementsParams> {
  final IAccountsRepository repository;

  GetCashbookStatementsUsecase({required this.repository});

  @override
  Future<Result<List<LedgerStatementEntity>>> call(
    GetCashbookStatementsParams params,
  ) =>
      repository.getCashbookStatements(
        fromDate: params.fromDate,
        toDate: params.toDate,
        accountId: params.accountId,
      );
}
