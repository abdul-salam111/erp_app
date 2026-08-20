import '../../../../core/utils/result.dart';

abstract interface class AttendanceRepository {
  Future<Result<dynamic>> performAction();
}
