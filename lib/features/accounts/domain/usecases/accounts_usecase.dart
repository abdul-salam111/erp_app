import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/accounts_repository.dart';

class AccountsUsecase implements Usecase<dynamic, NoParams> {
  final AccountsRepository repository;

  AccountsUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
