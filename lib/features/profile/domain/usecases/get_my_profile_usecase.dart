import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/profile_repository.dart';

class GetMyProfileUsecase implements Usecase<dynamic, NoParams> {
  final ProfileRepository repository;

  GetMyProfileUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.getMyProfile();
  }
}
