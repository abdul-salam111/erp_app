import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/leaves_repository.dart';

class GetLeaveByIdParams {
  final int id;

  const GetLeaveByIdParams({required this.id});
}

class GetLeaveByIdUsecase implements Usecase<dynamic, GetLeaveByIdParams> {
  final LeavesRepository repository;

  GetLeaveByIdUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(GetLeaveByIdParams params) {
    return repository.getById(params.id);
  }
}
