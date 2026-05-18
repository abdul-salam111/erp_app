import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../auth_exports.dart';

class AuthRepositoryImpl extends BaseRepository implements IAuthRepostiory {
  final IAuthRemoteDatasource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, UserToken>> signinUserById({
    required LoginUserById loginUserById,
  }) {
    return execute(
      call: () => dataSource.loginUserById(loginUserById: loginUserById),
    );
  }
}
