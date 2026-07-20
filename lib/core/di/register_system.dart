import '../../features/system/data/datasources/remote_system_datasource.dart';
import '../../features/system/data/repositories_impl/system_repository_impl.dart';
import '../../features/system/domain/repositories/system_repository.dart';
import '../../features/system/domain/usecases/system_usecase.dart';
import '../../features/system/presentation/system/blocs/system_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerSystem() async {
  // DataSource
  sl.registerLazySingleton<IRemoteSystemDataSource>(
    () => RemoteSystemDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<SystemRepository>(
    () => SystemRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<SystemUsecase>(
    () => SystemUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<SystemBloc>(
    () => SystemBloc(systemUsecase: sl()),
  );
}
