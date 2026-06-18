import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/account_list_item_entity.dart';
import '../repositories/i_accounts_repository.dart';

class GetAccountsListUsecase
    implements Usecase<List<AccountListItemEntity>, NoParams> {
  final IAccountsRepository repository;

  GetAccountsListUsecase({required this.repository});

  @override
  Future<Either<Failure, List<AccountListItemEntity>>> call(NoParams params) =>
      repository.getAccountsList();
}
