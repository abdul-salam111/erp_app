import '../../features/inventory/domain/usecases/get_current_stock_usecase.dart';
import '../../features/inventory/domain/usecases/get_stock_received_usecase.dart';
import '../../features/inventory/inventory_exports.dart';

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
  sl.registerLazySingleton<GetStockReceivedUsecase>(
    () => GetStockReceivedUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetCurrentStockUsecase>(
    () => GetCurrentStockUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<InventoryBloc>(
    () => InventoryBloc(getStockReceived: sl(), getCurrentStock: sl()),
  );
}
