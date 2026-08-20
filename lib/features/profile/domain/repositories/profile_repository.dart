import '../../../../core/utils/result.dart';

abstract interface class ProfileRepository {
  Future<Result<dynamic>> getMyProfile();
}
