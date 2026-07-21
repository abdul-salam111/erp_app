import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/attendance_repository.dart';

class AttendanceUsecase implements Usecase<dynamic, NoParams> {
  final AttendanceRepository repository;

  AttendanceUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
