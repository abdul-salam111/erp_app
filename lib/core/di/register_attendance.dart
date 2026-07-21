import '../../features/attendance/data/datasources/remote_attendance_datasource.dart';
import '../../features/attendance/data/repositories_impl/attendance_repository_impl.dart';
import '../../features/attendance/domain/repositories/attendance_repository.dart';
import '../../features/attendance/domain/usecases/attendance_usecase.dart';
import '../../features/attendance/presentation/attendance/blocs/attendance_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerAttendance() async {
  // DataSource
  sl.registerLazySingleton<IRemoteAttendanceDataSource>(
    () => RemoteAttendanceDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<AttendanceUsecase>(
    () => AttendanceUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<AttendanceBloc>(
    () => AttendanceBloc(attendanceUsecase: sl()),
  );
}
