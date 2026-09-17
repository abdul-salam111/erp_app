import '../../../../core/utils/result.dart';
import '../entities/system_entity.dart';

abstract interface class SystemRepository {
  Future<Result<List<SystemUserEntity>>> getUsersList();
  Future<Result<SystemUserDetailEntity>> getUserById(int id);
  Future<Result<List<LandingPageFeatureEntity>>> getLandingPageFeatures();
  Future<Result<List<BranchEntity>>> getBranchList({required int tenantId});
  Future<Result<List<RoleEntity>>> getRoleList();
}
