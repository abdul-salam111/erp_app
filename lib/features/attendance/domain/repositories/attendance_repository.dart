import '../../../../core/utils/result.dart';

abstract interface class AttendanceRepository {
  Future<Result<dynamic>> getMonth({required int year, required int month});
}
