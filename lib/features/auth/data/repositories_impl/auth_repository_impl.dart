import 'package:fpdart/fpdart.dart';
import 'package:mantic_erp_app/features/auth/auth_exports.dart';
import '../../../../core/shared/shared_exports.dart';

class AuthRepositoryImpl extends BaseRepository implements IAuthRepostiory {
  final IAuthRemoteDatasource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required LoginRequestModel loginRequestModel,
  }) {
    return execute(
      call: () async {
        final model = await dataSource.loginUser(
          loginRequestModel: loginRequestModel,
        );
        return model.toEntity();
      },
    );
  }
}
