import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../data/models/response_models/get_ledger/get_ledger_model.dart';
import '../repositories/accounts_repository.dart';

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
    implements Usecase<List<GetLedgerModel>, GetPartyStatementsParams> {
  final AccountsRepository repository;

  GetPartyStatementsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<GetLedgerModel>>> call(
    GetPartyStatementsParams params,
  ) =>
      repository.getPartyStatements(
        fromDate: params.fromDate,
        toDate: params.toDate,
        partyId: params.partyId,
      );
}
