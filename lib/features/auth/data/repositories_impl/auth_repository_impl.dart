import 'package:mantic_erp_app/features/auth/auth_exports.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../models/request_models/select_branch_request_model/select_branch_request_model.dart';

class AuthRepositoryImpl extends BaseRepository implements IAuthRepostiory {
  final IAuthRemoteDatasource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Result<UserEntity>> loginUser({
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

  @override
  Future<Result<AuthToken>> selectBranch({
    required SelectBranchRequestModel request,
  }) {
    return execute(
      call: () => dataSource.selectBranch(request: request),
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
