import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/overtime_repository.dart';

class OvertimeUsecase implements Usecase<dynamic, NoParams> {
  final OvertimeRepository repository;

  OvertimeUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
