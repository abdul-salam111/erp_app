import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteProfileDataSource {
  Future<dynamic> getMyProfile();
}

class RemoteProfileDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteProfileDataSource {
  RemoteProfileDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> getMyProfile() async {
    return post(
      url: ApiEndPoints.profile.getMyProfile,
      body: const {},
      parser: (json) => json,
    );
  }
}
