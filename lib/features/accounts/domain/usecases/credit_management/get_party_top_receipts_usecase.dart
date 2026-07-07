import 'package:fpdart/fpdart.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class GetPartyTopReceiptsParams {
  final String toDate;
  final int partyId;

  const GetPartyTopReceiptsParams({
    required this.toDate,
    required this.partyId,
  });
}

class GetPartyTopReceiptsUsecase
    implements
        Usecase<List<PartyTopReceiptEntity>, GetPartyTopReceiptsParams> {
  final IAccountsRepository repository;

  GetPartyTopReceiptsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PartyTopReceiptEntity>>> call( 
    GetPartyTopReceiptsParams params,
  ) =>
      repository.getPartyTopReceipts(
        toDate: params.toDate,
        partyId: params.partyId,
      );
}
