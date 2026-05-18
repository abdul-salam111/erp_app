import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../auth_exports.dart';

abstract interface class IAuthRemoteDatasource {
  Future<UserToken> loginUserById({required LoginUserById loginUserById});
  Future<dynamic> forgetPassword();
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

  @override
  Future<dynamic> forgetPassword() async {
    // TODO: implement forgetPassword API call
    throw UnimplementedError('forgetPassword not implemented');
  }
}
