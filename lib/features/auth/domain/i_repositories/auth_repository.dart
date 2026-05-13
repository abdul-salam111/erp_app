import 'package:fpdart/fpdart.dart';
import '../../../../core/networks/network_exports.dart';
import '../../auth_export.dart';

abstract interface class IAuthRepostiory {
  Future<Either<AppException, UserToken>> signinUserById({
    required LoginUserById loginUserById,
  });
}
