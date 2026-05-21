import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../auth_exports.dart';

abstract interface class IAuthRepostiory {
  Future<Either<Failure, LoggedInUserModel>> loginUser({
    required LoginRequestModel loginRequestModel,
  });
}
