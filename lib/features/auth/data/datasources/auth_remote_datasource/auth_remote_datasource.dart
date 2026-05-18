import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../models/request_models/login_user_by_id/login_user_by_id.dart';
import '../../models/response_models/user_token/user_token.dart';

abstract interface class IAuthRemoteDatasource {
  Future<UserToken> loginUserById({required LoginUserById loginUserById});

}

class IAuthRemoteDatasourceImpl extends BaseRemoteDatasource
    implements IAuthRemoteDatasource {
  IAuthRemoteDatasourceImpl({required super.dioHelper});

  @override
  Future<UserToken> loginUserById({
    required LoginUserById loginUserById,
  }) async {
    return post(
      url: ApiEndPoints.loginByUid,
      parser: (json) => UserToken.fromJson(json),
      body: loginUserById.toJson(),
    );
  }


}
