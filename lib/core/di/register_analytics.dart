import '../../features/analytics/data/datasources/remote_analytics_datasource.dart';
import '../../features/analytics/data/repositories_impl/analytics_repository_impl.dart';
import '../../features/analytics/domain/repositories/analytics_repository.dart';
import '../../features/analytics/domain/usecases/analytics_usecase.dart';
import '../../features/analytics/presentation/analytics/blocs/analytics_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerAnalytics() async {
  // DataSource
  sl.registerLazySingleton<IRemoteAnalyticsDataSource>(
    () => RemoteAnalyticsDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<AnalyticsRepository>(
    () => AnalyticsRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<AnalyticsUsecase>(
    () => AnalyticsUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<AnalyticsBloc>(
    () => AnalyticsBloc(analyticsUsecase: sl()),
  );
}
