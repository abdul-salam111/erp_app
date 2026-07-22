import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/salary_mgmt_repository.dart';

class SalaryMgmtUsecase implements Usecase<dynamic, NoParams> {
  final SalaryMgmtRepository repository;

  SalaryMgmtUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
