import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/leaves_repository.dart';

class GetLeaveBalancesUsecase implements Usecase<dynamic, NoParams> {
  final LeavesRepository repository;

  GetLeaveBalancesUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.getBalances();
  }
}
