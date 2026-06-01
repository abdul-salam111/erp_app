import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../auth_exports.dart';
import '../../data/models/request_models/select_branch_request_model/select_branch_request_model.dart';

abstract interface class IAuthRepostiory {
  Future<Either<Failure, UserEntity>> loginUser({
    required LoginRequestModel loginRequestModel,
  });

  Future<Either<Failure, AuthToken>> selectBranch({
    required SelectBranchRequestModel request,
  });
}
