import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../auth_exports.dart';

abstract interface class IAuthRepostiory {
  Future<Either<Failure, UserToken>> signinUserById({
    required LoginUserById loginUserById,
  });
}
