import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/i_repositories/auth_repository.dart';

class GetUserRolesUsecase implements Usecase<List<String>, String> {
  final IAuthRepostiory repository;
  GetUserRolesUsecase({required this.repository});

  @override
  Future<Result<List<String>>> call(String token) {
    return repository.getUserRoles(token: token);
  }
}
