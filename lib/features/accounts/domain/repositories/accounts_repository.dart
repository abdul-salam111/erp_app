import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';

abstract interface class AccountsRepository {
  // TODO: Define your repository methods here
  Future<Either<Failure, dynamic>> performAction();
  Future<Either<Failure, dynamic>> accountLedger();
}
