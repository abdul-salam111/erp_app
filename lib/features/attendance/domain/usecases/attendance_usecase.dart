import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/attendance_repository.dart';

class GetMonthParams {
  final int year;
  final int month;

  const GetMonthParams({required this.year, required this.month});
}

class AttendanceUsecase implements Usecase<dynamic, GetMonthParams> {
  final AttendanceRepository repository;

  AttendanceUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(GetMonthParams params) {
    return repository.getMonth(year: params.year, month: params.month);
  }
}
