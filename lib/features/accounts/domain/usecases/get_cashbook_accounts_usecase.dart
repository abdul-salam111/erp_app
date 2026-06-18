import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/cashbook_account_item_entity.dart';
import '../repositories/i_accounts_repository.dart';

class GetCashbookAccountsUsecase
    implements Usecase<List<CashbookAccountItemEntity>, NoParams> {
  final IAccountsRepository repository;

  GetCashbookAccountsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CashbookAccountItemEntity>>> call(
    NoParams params,
  ) =>
      repository.getCashbookAccounts();
}
