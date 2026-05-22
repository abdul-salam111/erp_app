import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../data/models/response_models/get_ledger/account_ledger_model.dart';
import '../repositories/accounts_repository.dart';

class GetAccountStatementsParams {
  final String fromDate;
  final String toDate;
  const GetAccountStatementsParams({
    required this.fromDate,
    required this.toDate,
  });
}

class GetAccountStatementsUsecase
    implements Usecase<List<AccountLedgerModel>, GetAccountStatementsParams> {
  final AccountsRepository repository;

  GetAccountStatementsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<AccountLedgerModel>>> call(
    GetAccountStatementsParams params,
  ) =>
      repository.getAccountStatements(
        fromDate: params.fromDate,
        toDate: params.toDate,
      );
}
