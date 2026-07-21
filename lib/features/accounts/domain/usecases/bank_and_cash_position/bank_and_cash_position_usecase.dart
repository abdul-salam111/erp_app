import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../entities/bank_and_cash_position/bank_cash_item_entity.dart';
import '../../repositories/i_accounts_repository.dart';

class BankAndCashPositionUsecase
    implements Usecase<List<BankCashItemEntity>, NoParams> {
  final IAccountsRepository repository;

  BankAndCashPositionUsecase({required this.repository});

  @override
  Future<Result<List<BankCashItemEntity>>> call(NoParams params) =>
      repository.bankAndCashPosition();
}
