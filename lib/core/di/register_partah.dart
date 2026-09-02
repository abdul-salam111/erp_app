import '../../features/partah/data/datasources/remote_partah_datasource.dart';
import '../../features/partah/data/repositories_impl/partah_repository_impl.dart';
import '../../features/partah/domain/repositories/partah_repository.dart';
import '../../features/partah/domain/usecases/partah_usecase.dart';
import '../../features/partah/presentation/partah/blocs/partah_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerPartah() async {
  // DataSource
  sl.registerLazySingleton<IRemotePartahDataSource>(
    () => RemotePartahDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<PartahRepository>(
    () => PartahRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<PartahUsecase>(
    () => PartahUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<PartahBloc>(
    () => PartahBloc(partahUsecase: sl()),
  );
}
