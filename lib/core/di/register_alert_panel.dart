import '../../features/alert_panel/data/datasources/remote_alert_panel_datasource.dart';
import '../../features/alert_panel/data/repositories_impl/alert_panel_repository_impl.dart';
import '../../features/alert_panel/domain/repositories/alert_panel_repository.dart';
import '../../features/alert_panel/domain/usecases/alert_panel_usecase.dart';
import '../../features/alert_panel/presentation/alert_panel/blocs/alert_panel_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerAlertPanel() async {
  // DataSource
  sl.registerLazySingleton<IRemoteAlertPanelDataSource>(
    () => RemoteAlertPanelDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<AlertPanelRepository>(
    () => AlertPanelRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<AlertPanelUsecase>(
    () => AlertPanelUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<AlertPanelBloc>(
    () => AlertPanelBloc(alertpanelUsecase: sl()),
  );
}
