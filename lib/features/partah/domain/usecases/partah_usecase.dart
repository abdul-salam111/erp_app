import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/partah_repository.dart';

class PartahUsecase implements Usecase<dynamic, NoParams> {
  final PartahRepository repository;

  PartahUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
