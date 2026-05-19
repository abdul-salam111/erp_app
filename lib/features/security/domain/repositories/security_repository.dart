import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';

abstract interface class SecurityRepository {
  // TODO: Define your repository methods here
  Future<Either<Failure, dynamic>> performAction();
}
