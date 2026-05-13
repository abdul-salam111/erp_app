import '../../../../app_exports.dart';

class SignInUsecase implements Usecase<UserToken, LoginUserById> {
  final IAuthRepostiory repository;

  SignInUsecase({required this.repository});

  @override
  Future<Either<AppException, UserToken>> call(LoginUserById loginUserById) {
    return repository.signinUserById(loginUserById: loginUserById);
  }
}
