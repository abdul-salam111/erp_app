import '../../../../core/utils/result.dart';
import '../../auth_exports.dart';
import '../../data/models/request_models/select_branch_request_model/select_branch_request_model.dart';

abstract interface class IAuthRepostiory {
  Future<Result<UserEntity>> loginUser({
    required LoginRequestModel loginRequestModel,
  });

  Future<Result<AuthToken>> selectBranch({
    required SelectBranchRequestModel request,
  });

  Future<Result<List<String>>> getUserFeatures({required String token});
  Future<Result<List<String>>> getUserRoles({required String token});
  Future<Result<bool>> deleteToken({required String accessToken});
}
