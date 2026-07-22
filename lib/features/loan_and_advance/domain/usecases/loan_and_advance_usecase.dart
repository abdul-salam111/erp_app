import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/loan_and_advance_repository.dart';

class LoanAndAdvanceUsecase implements Usecase<dynamic, NoParams> {
  final LoanAndAdvanceRepository repository;

  LoanAndAdvanceUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
