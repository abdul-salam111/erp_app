import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/shared_exports.dart';
import '../entities/party_credit_monthly_summary_entity.dart';
import '../repositories/i_accounts_repository.dart';

class GetPartyCreditMonthlySummaryParams {
  final String toDate;
  final int partyId;

  const GetPartyCreditMonthlySummaryParams({
    required this.toDate,
    required this.partyId,
  });
}

class GetPartyCreditMonthlySummaryUsecase
    implements Usecase<List<PartyCreditMonthlySummaryEntity>,
        GetPartyCreditMonthlySummaryParams> {
  final IAccountsRepository repository;

  GetPartyCreditMonthlySummaryUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PartyCreditMonthlySummaryEntity>>> call(
    GetPartyCreditMonthlySummaryParams params,
  ) =>
      repository.getPartyCreditMonthlySummary(
        toDate: params.toDate,
        partyId: params.partyId,
      );
}
