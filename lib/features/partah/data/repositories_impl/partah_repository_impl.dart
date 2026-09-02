import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/partah_repository.dart';
import '../datasources/remote_partah_datasource.dart';

class PartahRepositoryImpl extends BaseRepository
    implements PartahRepository {
  final IRemotePartahDataSource dataSource;

  PartahRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
