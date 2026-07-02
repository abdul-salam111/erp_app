import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../auth_exports.dart';
import '../../models/request_models/select_branch_request_model/select_branch_request_model.dart';

abstract interface class IAuthRemoteDatasource {
  Future<LoggedInUserModel> loginUser({
    required LoginRequestModel loginRequestModel,
  });

  Future<AuthToken> selectBranch({
    required SelectBranchRequestModel request,
  });
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
}
