import '../../features/overtime/data/datasources/remote_overtime_datasource.dart';
import '../../features/overtime/data/repositories_impl/overtime_repository_impl.dart';
import '../../features/overtime/domain/repositories/overtime_repository.dart';
import '../../features/overtime/domain/usecases/overtime_usecase.dart';
import '../../features/overtime/presentation/overtime/blocs/overtime_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerOvertime() async {
  // DataSource
  sl.registerLazySingleton<IRemoteOvertimeDataSource>(
    () => RemoteOvertimeDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<OvertimeRepository>(
    () => OvertimeRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<OvertimeUsecase>(
    () => OvertimeUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<OvertimeBloc>(
    () => OvertimeBloc(overtimeUsecase: sl()),
  );
}
