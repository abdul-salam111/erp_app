import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../accounts_exports.dart';

class BankAndCashPositionUsecase implements Usecase<dynamic, NoParams> {
  final AccountsRepository repository;

  BankAndCashPositionUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return Future.delayed(Duration());
  }
}
