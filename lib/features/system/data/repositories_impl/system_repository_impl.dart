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

  @override
  Future<Result<SystemUserDetailEntity>> getUserById(int id) {
    return execute(
      call: () async {
        final model = await dataSource.getUserById(id);
        return model.toEntity();
      },
    );
  }

  @override
  Future<Result<List<LandingPageFeatureEntity>>> getLandingPageFeatures() {
    return execute(
      call: () async {
        final models = await dataSource.getLandingPageFeatures();
        return models.map((m) => m.toEntity()).toList();
      },
    );
  }

  @override
  Future<Result<List<BranchEntity>>> getBranchList({required int tenantId}) {
    return execute(
      call: () async {
        final models = await dataSource.getBranchList(tenantId: tenantId);
        return models.map((m) => m.toEntity()).toList();
      },
    );
  }

  @override
  Future<Result<List<RoleEntity>>> getRoleList({int? organizationId}) {
    return execute(
      call: () async {
        final models =
            await dataSource.getRoleList(organizationId: organizationId);
        return models.map((m) => m.toEntity()).toList();
      },
    );
  }

  @override
  Future<Result<RoleEntity>> getRoleById(int id) {
    return execute(
      call: () async {
        final model = await dataSource.getRoleById(id);
        return model.toEntity();
      },
    );
  }

  @override
  Future<Result<RoleEntity>> saveRole(Map<String, dynamic> payload) {
    return execute(
      call: () async {
        final model = await dataSource.saveRole(payload);
        return model.toEntity();
      },
    );
  }

  @override
  Future<Result<SystemUserDetailEntity>> saveUser(
    Map<String, dynamic> payload,
  ) {
    return execute(
      call: () async {
        final model = await dataSource.saveUser(payload);
        return model.toEntity();
      },
    );
  }

  @override
  Future<Result<bool>> deleteUser(int id) {
    return execute(
      call: () async => dataSource.deleteUser(id),
    );
  }
}
