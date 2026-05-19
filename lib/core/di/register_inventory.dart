import '../../features/inventory/data/datasources/remote_inventory_datasource.dart';
import '../../features/inventory/data/repositories_impl/inventory_repository_impl.dart';
import '../../features/inventory/domain/repositories/inventory_repository.dart';
import '../../features/inventory/domain/usecases/inventory_usecase.dart';
import '../../features/inventory/presentation/inventory/blocs/inventory_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerInventory() async {
  // DataSource
  sl.registerLazySingleton<IRemoteInventoryDataSource>(
    () => RemoteInventoryDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<InventoryUsecase>(
    () => InventoryUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<InventoryBloc>(
    () => InventoryBloc(inventoryUsecase: sl()),
  );
}
