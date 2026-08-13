import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../auth_exports.dart';
import '../../models/request_models/delete_token_request_model/delete_token_request_model.dart';
import '../../models/request_models/select_branch_request_model/select_branch_request_model.dart';

abstract interface class IAuthRemoteDatasource {
  Future<LoggedInUserModel> loginUser({
    required LoginRequestModel loginRequestModel,
  });

  Future<AuthToken> selectBranch({
    required SelectBranchRequestModel request,
  });

  Future<List<String>> getUserFeatures({required String token});
  Future<List<String>> getUserRoles({required String token});
  Future<bool> deleteToken({required String accessToken});
}

class IAuthRemoteDatasourceImpl extends BaseRemoteDatasource
    implements IAuthRemoteDatasource {
  IAuthRemoteDatasourceImpl({required super.dioHelper});

  @override
  Future<LoggedInUserModel> loginUser({
    required LoginRequestModel loginRequestModel,
  }) async {
    return post(
      url: ApiEndPoints.auth.login,
      parser: (json) => LoggedInUserModel.fromJson(json),
      body: loginRequestModel.toJson(),
    );
  }

  @override
  Future<AuthToken> selectBranch({
    required SelectBranchRequestModel request,
  }) async {
    return post(
      url: ApiEndPoints.auth.selectBranch,
      parser: (json) => AuthToken.fromJson(json),
      body: request.toJson(),
    );
  }

  @override
  Future<List<String>> getUserFeatures({required String token}) async {
    return postList<String>(
      url: ApiEndPoints.auth.getUserFeatures,
      body: {},
      parser: (json) => json as String,
      authToken: token,
    );
  }

  @override
  Future<List<String>> getUserRoles({required String token}) async {
    return postList<String>(
      url: ApiEndPoints.auth.getUserRoles,
      body: {},
      parser: (json) => json as String,
      authToken: token,
    );
  }

  @override
  Future<bool> deleteToken({required String accessToken}) async {
    return post(
      url: ApiEndPoints.auth.deleteToken,
      parser: (json) => json as bool,
      body: DeleteTokenRequestModel(accessToken: accessToken).toJson(),
      authToken: accessToken,
    );
  }
}
