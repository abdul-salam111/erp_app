import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../datasources/auth_remote_datasource/auth_remote_datasource.dart';
import '../models/request_models/login_user_by_id/login_user_by_id.dart';
import '../models/response_models/user_token/user_token.dart';
import '../../domain/i_repositories/auth_repository.dart';

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
