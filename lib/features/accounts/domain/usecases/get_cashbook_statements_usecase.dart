import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/cashbook_statement_entity.dart';
import '../repositories/i_accounts_repository.dart';

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
        Usecase<List<CashbookStatementEntity>, GetCashbookStatementsParams> {
  final IAccountsRepository repository;

  GetCashbookStatementsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CashbookStatementEntity>>> call(
    GetCashbookStatementsParams params,
  ) =>
      repository.getCashbookStatements(
        fromDate: params.fromDate,
        toDate: params.toDate,
        accountId: params.accountId,
      );
}
