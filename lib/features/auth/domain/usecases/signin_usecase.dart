import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../auth_exports.dart';

class SignInUsecase implements Usecase<UserEntity, LoginParams> {
  final AuthRepository repository;

  SignInUsecase({required this.repository});

  @override
  Future<Result<UserEntity>> call(LoginParams params) {
    return repository.loginUser(params: params);
  }
}
