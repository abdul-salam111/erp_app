import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../entities/shared/ledger_statement_entity.dart';
import '../../repositories/i_accounts_repository.dart';

class GetPartyStatementsParams {
  final String fromDate;
  final String toDate;
  final int? partyId;
  const GetPartyStatementsParams({
    required this.fromDate,
    required this.toDate,
    this.partyId,
  });
}

class GetPartyStatementsUsecase
    implements Usecase<List<LedgerStatementEntity>, GetPartyStatementsParams> {
  final IAccountsRepository repository;

  GetPartyStatementsUsecase({required this.repository});

  @override
  Future<Result<List<LedgerStatementEntity>>> call(
    GetPartyStatementsParams params,
  ) =>
      repository.getPartyStatements(
        fromDate: params.fromDate,
        toDate: params.toDate,
        partyId: params.partyId,
      );
}
