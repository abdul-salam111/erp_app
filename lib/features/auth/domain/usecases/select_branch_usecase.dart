import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../auth_exports.dart';
import '../../data/models/request_models/select_branch_request_model/select_branch_request_model.dart';

class SelectBranchUsecase implements Usecase<AuthToken, SelectBranchRequestModel> {
  final IAuthRepostiory repository;

  SelectBranchUsecase({required this.repository});

  @override
  Future<Result<AuthToken>> call(SelectBranchRequestModel params) {
    return repository.selectBranch(request: params);
  }
}
