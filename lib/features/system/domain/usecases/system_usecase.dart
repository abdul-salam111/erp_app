import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/system_repository.dart';

class SystemUsecase implements Usecase<dynamic, NoParams> {
  final SystemRepository repository;

  SystemUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
