import 'package:fpdart/fpdart.dart';

import '../../../../core/networks/network_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../auth_exports.dart';

class ForgetPasswordUsecase implements Usecase<dynamic, NoParams> {
  final IAuthRepostiory repository;

  ForgetPasswordUsecase({required this.repository});

  @override
  Future<Either<AppException, dynamic>> call(NoParams params) {
    return repository.forgetPassword();
  }
}
