import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/party_list_item_entity.dart';
import '../repositories/accounts_repository.dart';

class GetPartyListUsecase
    implements Usecase<List<PartyListItemEntity>, NoParams> {
  final AccountsRepository repository;

  GetPartyListUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PartyListItemEntity>>> call(NoParams params) =>
      repository.getPartyList();
}
