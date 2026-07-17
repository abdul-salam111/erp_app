import '../../features/sale_order/data/datasources/remote_sale_order_datasource.dart';
import '../../features/sale_order/data/repositories_impl/sale_order_repository_impl.dart';
import '../../features/sale_order/domain/repositories/sale_order_repository.dart';
import '../../features/sale_order/domain/usecases/sale_order_usecase.dart';
import '../../features/sale_order/domain/usecases/create_sale_order_usecase.dart';
import '../../features/sale_order/domain/usecases/get_sale_order_by_id_usecase.dart';
import '../../features/sale_order/domain/usecases/get_sale_parties_usecase.dart';
import '../../features/sale_order/presentation/sale_order/blocs/sale_order_bloc.dart';
import '../../features/sale_order/presentation/create_sale_order/blocs/create_sale_order_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerSaleOrder() async {
  // DataSource
  sl.registerLazySingleton<IRemoteSaleOrderDataSource>(
    () => RemoteSaleOrderDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<SaleOrderRepository>(
    () => SaleOrderRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<SaleOrderUsecase>(
    () => SaleOrderUsecase(repository: sl()),
  );
  sl.registerLazySingleton<CreateSaleOrderUsecase>(
    () => CreateSaleOrderUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetSaleOrderByIdUsecase>(
    () => GetSaleOrderByIdUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetSalePartiesUsecase>(
    () => GetSalePartiesUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<SaleOrderBloc>(
    () => SaleOrderBloc(saleorderUsecase: sl()),
  );
  sl.registerFactory<CreateSaleOrderBloc>(
    () => CreateSaleOrderBloc(
      createSaleOrderUsecase: sl(),
      getSaleOrderByIdUsecase: sl(),
      getSalePartiesUsecase: sl(),
    ),
  );
}
