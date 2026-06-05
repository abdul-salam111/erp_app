import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/bank_cash_item_entity.dart';
import '../repositories/accounts_repository.dart';

class BankAndCashPositionUsecase
    implements Usecase<List<BankCashItemEntity>, NoParams> {
  final AccountsRepository repository;

  BankAndCashPositionUsecase({required this.repository});

  @override
  Future<Either<Failure, List<BankCashItemEntity>>> call(NoParams params) =>
      repository.bankAndCashPosition();
}
