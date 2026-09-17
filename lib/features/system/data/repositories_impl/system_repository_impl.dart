import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/system_entity.dart';
import '../../domain/repositories/system_repository.dart';
import '../datasources/remote_system_datasource.dart';
import '../mappers/system_mappers.dart';

class SystemRepositoryImpl extends BaseRepository implements SystemRepository {
  final IRemoteSystemDataSource dataSource;

  SystemRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<SystemUserEntity>>> getUsersList() {
    return execute(
      call: () async {
        final models = await dataSource.getUsersList();
        return models.map((m) => m.toEntity()).toList();
      },
    );
  }
}
