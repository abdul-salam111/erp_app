import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/remote_profile_datasource.dart';

class ProfileRepositoryImpl extends BaseRepository
    implements ProfileRepository {
  final IRemoteProfileDataSource dataSource;

  ProfileRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> getMyProfile() {
    return execute(call: () => dataSource.getMyProfile());
  }
}
