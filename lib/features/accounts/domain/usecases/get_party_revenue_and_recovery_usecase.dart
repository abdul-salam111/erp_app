import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/shared_exports.dart';
import '../entities/party_revenue_and_recovery_entity.dart';
import '../repositories/i_accounts_repository.dart';

class GetPartyRevenueAndRecoveryParams {
  final String toDate;
  final int partyId;
  const GetPartyRevenueAndRecoveryParams({
    required this.toDate,
    required this.partyId,
  });
}

class GetPartyRevenueAndRecoveryUsecase
    implements
        Usecase<PartyRevenueAndRecoveryEntity,
            GetPartyRevenueAndRecoveryParams> {
  final IAccountsRepository repository;
  GetPartyRevenueAndRecoveryUsecase({required this.repository});

  @override
  Future<Either<Failure, PartyRevenueAndRecoveryEntity>> call(
    GetPartyRevenueAndRecoveryParams params,
  ) =>
      repository.getPartyRevenueAndRecovery(
        toDate: params.toDate,
        partyId: params.partyId,
      );
}
