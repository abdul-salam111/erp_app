import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../auth_export.dart';

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
