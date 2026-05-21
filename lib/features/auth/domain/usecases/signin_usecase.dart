import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../auth_exports.dart';

class SignInUsecase implements Usecase<LoggedInUserModel, LoginRequestModel> {
  final IAuthRepostiory repository;

  SignInUsecase({required this.repository});

  @override
  Future<Either<Failure, LoggedInUserModel>> call(
    LoginRequestModel loginRequestModel,
  ) {
    return repository.loginUser(loginRequestModel: loginRequestModel);
  }
}
