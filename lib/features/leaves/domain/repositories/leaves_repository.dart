import '../../../../core/utils/result.dart';

abstract interface class LeavesRepository {
  Future<Result<dynamic>> getLeaves();
  Future<Result<dynamic>> applyLeave(Map<String, dynamic> body);
  Future<Result<dynamic>> getBalances();
  Future<Result<dynamic>> getById(int id);
}
