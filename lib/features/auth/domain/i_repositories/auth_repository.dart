import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../data/models/request_models/login_user_by_id/login_user_by_id.dart';
import '../../data/models/response_models/user_token/user_token.dart';

abstract interface class IAuthRepostiory {
  Future<Either<Failure, UserToken>> signinUserById({
    required LoginUserById loginUserById,
  });
}
