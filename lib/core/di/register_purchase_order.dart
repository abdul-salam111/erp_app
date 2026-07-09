import '../../features/purchase_order/data/datasources/remote_purchase_order_datasource.dart';
import '../../features/purchase_order/data/repositories_impl/purchase_order_repository_impl.dart';
import '../../features/purchase_order/domain/repositories/purchase_order_repository.dart';
import '../../features/purchase_order/domain/usecases/purchase_order_usecase.dart';
import '../../features/purchase_order/presentation/purchase_order/blocs/purchase_order_bloc.dart';
import 'app_dependencies.dart';
import '../../features/purchase_order/domain/usecases/create_purchase_order_usecase.dart';
import '../../features/purchase_order/presentation/create_purchase_order/blocs/create_purchase_order_bloc.dart';

Future<void> registerPurchaseOrder() async {
  // DataSource
  sl.registerLazySingleton<IRemotePurchaseOrderDataSource>(
    () => RemotePurchaseOrderDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<PurchaseOrderRepository>(
    () => PurchaseOrderRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<PurchaseOrderUsecase>(
    () => PurchaseOrderUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<PurchaseOrderBloc>(
    () => PurchaseOrderBloc(purchaseorderUsecase: sl()),
  );
  // UseCase — CreatePurchaseOrder
  sl.registerLazySingleton<CreatePurchaseOrderUsecase>(
    () => CreatePurchaseOrderUsecase(repository: sl()),
  );
  // BLoC — CreatePurchaseOrder screen
  sl.registerFactory<CreatePurchaseOrderBloc>(
    () => CreatePurchaseOrderBloc(createPurchaseOrderUsecase: sl()),
  );
}
