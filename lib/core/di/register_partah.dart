import '../../features/partah/data/datasources/remote_partah_datasource.dart';
import '../../features/partah/data/repositories_impl/partah_repository_impl.dart';
import '../../features/partah/domain/repositories/partah_repository.dart';
import '../../features/partah/domain/usecases/delete_report_usecase.dart';
import '../../features/partah/domain/usecases/get_active_product_templates_usecase.dart';
import '../../features/partah/domain/usecases/get_all_reports_usecase.dart';
import '../../features/partah/domain/usecases/get_last_costs_usecase.dart';
import '../../features/partah/domain/usecases/get_last_production_entries_usecase.dart';
import '../../features/partah/domain/usecases/get_product_templates_usecase.dart';
import '../../features/partah/domain/usecases/save_partah_record_usecase.dart';
import '../../features/partah/domain/usecases/save_product_templates_usecase.dart';
import '../../features/partah/presentation/manage_products/blocs/manage_products_bloc.dart';
import '../../features/partah/presentation/partah/blocs/partah_bloc.dart';
import '../../features/partah/presentation/reports/blocs/reports_bloc.dart';
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
  sl.registerLazySingleton(() => GetProductTemplatesUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetLastCostsUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetLastProductionEntriesUsecase(repository: sl()));
  sl.registerLazySingleton(() => SavePartahRecordUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetActiveProductTemplatesUsecase(repository: sl()));
  sl.registerLazySingleton(() => SaveProductTemplatesUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAllReportsUsecase(repository: sl()));
  sl.registerLazySingleton(() => DeleteReportUsecase(repository: sl()));

  // BLoCs
  sl.registerFactory<PartahBloc>(
    () => PartahBloc(
      getProductTemplates: sl(),
      getLastCosts: sl(),
      getLastProductionEntries: sl(),
      saveRecord: sl(),
    ),
  );
  sl.registerFactory<ManageProductsBloc>(
    () => ManageProductsBloc(
      getActiveProductTemplates: sl(),
      saveProductTemplates: sl(),
    ),
  );
  sl.registerFactory<ReportsBloc>(
    () => ReportsBloc(getAllReports: sl(), deleteReport: sl()),
  );
}
