import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/accounts_repository.dart';

class AccountLedgerUsecase implements Usecase<dynamic, NoParams> {
  final AccountsRepository repository;

  AccountLedgerUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.accountLedger();
  }
}
