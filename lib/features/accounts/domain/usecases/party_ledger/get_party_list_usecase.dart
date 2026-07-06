import 'package:fpdart/fpdart.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../entities/party_ledger/party_list_item_entity.dart';
import '../../repositories/i_accounts_repository.dart';

class GetPartyListUsecase
    implements Usecase<List<PartyListItemEntity>, NoParams> {
  final IAccountsRepository repository;

  GetPartyListUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PartyListItemEntity>>> call(NoParams params) =>
      repository.getPartyList();
}
