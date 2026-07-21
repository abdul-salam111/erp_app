import '../../features/dashboard/dashboard_exports.dart';
import 'app_dependencies.dart';

Future<void> registerDashboard() async {
  // DataSource
  sl.registerLazySingleton<IRemoteDashboardDataSource>(
    () => RemoteDashboardDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetDailyStatsUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetMonthlyStatsUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetMonthlyStatsDetailUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetSaleOrderSummaryUsecase(repository: sl()));

  // BLoC
  sl.registerFactory<AdminDashboardBloc>(
    () => AdminDashboardBloc(
      getDailyStats:          sl(),
      getMonthlyStats:        sl(),
      getMonthlyStatsDetail:  sl(),
      getSaleOrderSummary:    sl(),
    ),
  );
}
