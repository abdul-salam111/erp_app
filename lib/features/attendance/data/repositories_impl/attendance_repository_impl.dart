import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../datasources/remote_attendance_datasource.dart';

class AttendanceRepositoryImpl extends BaseRepository
    implements AttendanceRepository {
  final IRemoteAttendanceDataSource dataSource;

  AttendanceRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
