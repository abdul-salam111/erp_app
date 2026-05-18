import 'package:fpdart/fpdart.dart';

import '../../../../core/networks/network_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../auth_exports.dart';

class SignInUsecase implements Usecase<UserToken, LoginUserById> {
  final IAuthRepostiory repository;

  SignInUsecase({required this.repository});

  @override
  Future<Either<AppException, UserToken>> call(LoginUserById loginUserById) {
    return repository.signinUserById(loginUserById: loginUserById);
  }
}
