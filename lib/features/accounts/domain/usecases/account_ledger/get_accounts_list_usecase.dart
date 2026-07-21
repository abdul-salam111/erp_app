import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../entities/account_ledger/account_list_item_entity.dart';
import '../../repositories/i_accounts_repository.dart';

class GetAccountsListUsecase
    implements Usecase<List<AccountListItemEntity>, NoParams> {
  final IAccountsRepository repository;

  GetAccountsListUsecase({required this.repository});

  @override
  Future<Result<List<AccountListItemEntity>>> call(NoParams params) =>
      repository.getAccountsList();
}
