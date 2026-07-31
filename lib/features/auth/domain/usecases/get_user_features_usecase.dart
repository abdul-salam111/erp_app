import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../auth_exports.dart';

class GetUserFeaturesUsecase implements Usecase<List<String>, String> {
  final IAuthRepostiory repository;

  GetUserFeaturesUsecase({required this.repository});

  @override
  Future<Result<List<String>>> call(String token) {
    return repository.getUserFeatures(token: token);
  }
}
