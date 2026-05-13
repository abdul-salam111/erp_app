import 'package:fpdart/fpdart.dart';

import '../../../../core/networks/network_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../auth_export.dart';

class AuthRepositoryImpl extends BaseRepository implements IAuthRepostiory {
  final IAuthRemoteDatasource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppException, UserToken>> signinUserById({
    required LoginUserById loginUserById,
  }) {
    return execute(
      call: () => dataSource.loginUserById(loginUserById: loginUserById),
    );
  }
}
