import '../../../../core/utils/result.dart';

abstract interface class LeavesRepository {
  Future<Result<dynamic>> getLeaves();
}
