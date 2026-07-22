import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/leaves_repository.dart';

class LeavesUsecase implements Usecase<dynamic, NoParams> {
  final LeavesRepository repository;

  LeavesUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.getLeaves();
  }
}
