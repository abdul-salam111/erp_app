import '../../features/leaves/data/datasources/remote_leaves_datasource.dart';
import '../../features/leaves/data/repositories_impl/leaves_repository_impl.dart';
import '../../features/leaves/domain/repositories/leaves_repository.dart';
import '../../features/leaves/domain/usecases/leaves_usecase.dart';
import '../../features/leaves/presentation/leaves/blocs/leaves_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerLeaves() async {
  // DataSource
  sl.registerLazySingleton<IRemoteLeavesDataSource>(
    () => RemoteLeavesDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<LeavesRepository>(
    () => LeavesRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<LeavesUsecase>(
    () => LeavesUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<LeavesBloc>(
    () => LeavesBloc(leavesUsecase: sl()),
  );
}
