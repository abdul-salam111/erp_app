import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../entities/credit_managment/party_unpaid_debit_entity.dart';
import '../../repositories/i_accounts_repository.dart';

class GetPartyUnpaidDebitsParams {
  final String toDate;
  final int partyId;

  const GetPartyUnpaidDebitsParams({
    required this.toDate,
    required this.partyId,
  });
}

class GetPartyUnpaidDebitsUsecase
    implements
        Usecase<List<PartyUnpaidDebitEntity>, GetPartyUnpaidDebitsParams> {
  final IAccountsRepository repository;

  GetPartyUnpaidDebitsUsecase({required this.repository});

  @override
  Future<Result<List<PartyUnpaidDebitEntity>>> call(
    GetPartyUnpaidDebitsParams params,
  ) =>
      repository.getPartyUnpaidDebits(
        toDate: params.toDate,
        partyId: params.partyId,
      );
}
