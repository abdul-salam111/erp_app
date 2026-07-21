import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../entities/shared/ledger_statement_entity.dart';
import '../../repositories/i_accounts_repository.dart';

class GetAccountStatementsParams {
  final String fromDate;
  final String toDate;
  final int? accountId;
  const GetAccountStatementsParams({
    required this.fromDate,
    required this.toDate,
    this.accountId,
  });
}

class GetAccountStatementsUsecase
    implements Usecase<List<LedgerStatementEntity>, GetAccountStatementsParams> {
  final IAccountsRepository repository;

  GetAccountStatementsUsecase({required this.repository});

  @override
  Future<Result<List<LedgerStatementEntity>>> call(
    GetAccountStatementsParams params,
  ) =>
      repository.getAccountStatements(
        fromDate: params.fromDate,
        toDate: params.toDate,
        accountId: params.accountId,
      );
}
