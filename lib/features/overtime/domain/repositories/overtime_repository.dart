import '../../../../core/utils/result.dart';

abstract interface class OvertimeRepository {
  Future<Result<dynamic>> performAction();
  Future<Result<dynamic>> applyOvertime(Map<String, dynamic> body);
}
