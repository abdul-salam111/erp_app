import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/system_entity.dart';
import '../repositories/system_repository.dart';

class GetUsersListUsecase
    implements Usecase<List<SystemUserEntity>, NoParams> {
  final SystemRepository repository;

  GetUsersListUsecase({required this.repository});

  @override
  Future<Result<List<SystemUserEntity>>> call(NoParams params) {
    return repository.getUsersList();
  }
}

class GetUserByIdUsecase implements Usecase<SystemUserDetailEntity, int> {
  final SystemRepository repository;

  GetUserByIdUsecase({required this.repository});

  @override
  Future<Result<SystemUserDetailEntity>> call(int id) {
    return repository.getUserById(id);
  }
}

class GetLandingPageFeaturesUsecase
    implements Usecase<List<LandingPageFeatureEntity>, NoParams> {
  final SystemRepository repository;

  GetLandingPageFeaturesUsecase({required this.repository});

  @override
  Future<Result<List<LandingPageFeatureEntity>>> call(NoParams params) {
    return repository.getLandingPageFeatures();
  }
}

class GetBranchListUsecase implements Usecase<List<BranchEntity>, int> {
  final SystemRepository repository;

  GetBranchListUsecase({required this.repository});

  @override
  Future<Result<List<BranchEntity>>> call(int tenantId) {
    return repository.getBranchList(tenantId: tenantId);
  }
}

class GetRoleListUsecase implements Usecase<List<RoleEntity>, int?> {
  final SystemRepository repository;

  GetRoleListUsecase({required this.repository});

  @override
  Future<Result<List<RoleEntity>>> call(int? organizationId) {
    return repository.getRoleList(organizationId: organizationId);
  }
}

class SaveUserUsecase
    implements Usecase<SystemUserDetailEntity, Map<String, dynamic>> {
  final SystemRepository repository;

  SaveUserUsecase({required this.repository});

  @override
  Future<Result<SystemUserDetailEntity>> call(Map<String, dynamic> payload) {
    return repository.saveUser(payload);
  }
}

class DeleteUserUsecase implements Usecase<bool, int> {
  final SystemRepository repository;

  DeleteUserUsecase({required this.repository});

  @override
  Future<Result<bool>> call(int id) {
    return repository.deleteUser(id);
  }
}
