import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/repositories/auth_repository.dart';

class GetUserRolesUsecase implements Usecase<List<String>, String> {
  final AuthRepository repository;
  GetUserRolesUsecase({required this.repository});

  @override
  Future<Result<List<String>>> call(String token) {
    return repository.getUserRoles(token: token);
  }
}
