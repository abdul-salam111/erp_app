import '../../../../../app_exports.dart';

abstract interface class IAuthRepostiory {
  Future<Either<AppException, UserToken>> signinUserById({
    required LoginUserById loginUserById,
  });
}
