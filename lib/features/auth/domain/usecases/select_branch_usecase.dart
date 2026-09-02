import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../auth_exports.dart';

class SelectBranchUsecase implements Usecase<AuthToken, SelectBranchParams> {
  final IAuthRepostiory repository;

  SelectBranchUsecase({required this.repository});

  @override
  Future<Result<AuthToken>> call(SelectBranchParams params) {
    return repository.selectBranch(params: params);
  }
}
