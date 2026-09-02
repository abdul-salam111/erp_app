import 'package:mantic_erp_app/features/auth/auth_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../models/request_models/select_branch_request_model/select_branch_request_model.dart';

class AuthRepositoryImpl extends BaseRepository implements IAuthRepostiory {
  final IAuthRemoteDatasource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Result<UserEntity>> loginUser({required LoginParams params}) {
    return execute(
      call: () async {
        final model = await dataSource.loginUser(
          loginRequestModel: LoginRequestModel(
            email: params.email,
            password: params.password,
          ),
        );
        return model.toEntity();
      },
    );
  }

  @override
  Future<Result<AuthToken>> selectBranch({
    required SelectBranchParams params,
  }) {
    return execute(
      call: () => dataSource.selectBranch(
        request: SelectBranchRequestModel(
          accessToken: params.accessToken,
          misBranchId: params.misBranchId,
          refreshToken: params.refreshToken,
        ),
      ),
    );
  }

  @override
  Future<Result<List<String>>> getUserFeatures({required String token}) {
    return execute(
      call: () => dataSource.getUserFeatures(token: token),
    );
  }

  @override
  Future<Result<List<String>>> getUserRoles({required String token}) {
    return execute(
      call: () => dataSource.getUserRoles(token: token),
    );
  }

  @override
  Future<Result<bool>> deleteToken({required String accessToken}) {
    return execute(
      call: () => dataSource.deleteToken(accessToken: accessToken),
    );
  }
}
