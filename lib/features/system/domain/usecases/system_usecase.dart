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
