import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../auth_exports.dart';

abstract interface class IAuthRemoteDatasource {
  Future<LoggedInUserModel> loginUser({
    required LoginRequestModel loginRequestModel,
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
      url: ApiEndPoints.loginUser,
      parser: (json) => LoggedInUserModel.fromJson(json),
      body: loginRequestModel.toJson(),
      
    );
  }
}
