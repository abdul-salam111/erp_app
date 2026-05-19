import '../../features/production/data/datasources/remote_production_datasource.dart';
import '../../features/production/data/repositories_impl/production_repository_impl.dart';
import '../../features/production/domain/repositories/production_repository.dart';
import '../../features/production/domain/usecases/production_usecase.dart';
import '../../features/production/presentation/production/blocs/production_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerProduction() async {
  // DataSource
  sl.registerLazySingleton<IRemoteProductionDataSource>(
    () => RemoteProductionDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<ProductionRepository>(
    () => ProductionRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<ProductionUsecase>(
    () => ProductionUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<ProductionBloc>(
    () => ProductionBloc(productionUsecase: sl()),
  );
}
