import '../../../../core/utils/result.dart';
import '../../auth_exports.dart';

abstract interface class IAuthRepostiory {
  Future<Result<UserEntity>> loginUser({required LoginParams params});

  Future<Result<AuthToken>> selectBranch({required SelectBranchParams params});

  Future<Result<List<String>>> getUserFeatures({required String token});
  Future<Result<List<String>>> getUserRoles({required String token});
  Future<Result<bool>> deleteToken({required String accessToken});
}
