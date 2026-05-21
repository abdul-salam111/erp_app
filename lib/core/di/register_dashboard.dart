
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
  sl.registerLazySingleton<DashboardUsecase>(
    () => DashboardUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<DashboardBloc>(
    () => DashboardBloc(),
  );
}
