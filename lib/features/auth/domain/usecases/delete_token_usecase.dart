import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/repositories/auth_repository.dart';

class DeleteTokenUsecase implements Usecase<bool, String> {
  final AuthRepository repository;
  DeleteTokenUsecase({required this.repository});

  @override
  Future<Result<bool>> call(String accessToken) {
    return repository.deleteToken(accessToken: accessToken);
  }
}
