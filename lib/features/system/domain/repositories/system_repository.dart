import '../../../../core/utils/result.dart';
import '../entities/system_entity.dart';

abstract interface class SystemRepository {
  Future<Result<List<SystemUserEntity>>> getUsersList();
  Future<Result<SystemUserDetailEntity>> getUserById(int id);
  Future<Result<List<LandingPageFeatureEntity>>> getLandingPageFeatures();
  Future<Result<List<BranchEntity>>> getBranchList({required int tenantId});
  Future<Result<List<RoleEntity>>> getRoleList({int? organizationId});
  Future<Result<RoleEntity>> getRoleById(int id);
  Future<Result<RoleEntity>> saveRole(Map<String, dynamic> payload);
  Future<Result<SystemUserDetailEntity>> saveUser(Map<String, dynamic> payload);
  Future<Result<bool>> deleteUser(int id);
}
