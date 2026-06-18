import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';

import '../repositories/i_accounts_repository.dart';

class CreditManagementUsecase implements Usecase<dynamic, NoParams> {
  final IAccountsRepository repository;

  CreditManagementUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.creditManagement();
  }
}
