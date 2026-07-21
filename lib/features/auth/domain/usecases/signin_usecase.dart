import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../auth_exports.dart';

class SignInUsecase implements Usecase<UserEntity, LoginRequestModel> {
  final IAuthRepostiory repository;

  SignInUsecase({required this.repository});

  @override
  Future<Result<UserEntity>> call(
    LoginRequestModel loginRequestModel,
  ) {
    return repository.loginUser(loginRequestModel: loginRequestModel);
  }
}
