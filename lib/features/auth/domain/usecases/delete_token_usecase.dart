import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/i_repositories/auth_repository.dart';

class DeleteTokenUsecase implements Usecase<bool, String> {
  final IAuthRepostiory repository;
  DeleteTokenUsecase({required this.repository});

  @override
  Future<Result<bool>> call(String accessToken) {
    return repository.deleteToken(accessToken: accessToken);
  }
}
