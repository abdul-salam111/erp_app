import '../../features/security/data/datasources/remote_security_datasource.dart';
import '../../features/security/data/repositories_impl/security_repository_impl.dart';
import '../../features/security/domain/repositories/security_repository.dart';
import '../../features/security/domain/usecases/security_usecase.dart';
import '../../features/security/presentation/security/blocs/security_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerSecurity() async {
  // DataSource
  sl.registerLazySingleton<IRemoteSecurityDataSource>(
    () => RemoteSecurityDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<SecurityRepository>(
    () => SecurityRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<SecurityUsecase>(
    () => SecurityUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<SecurityBloc>(
    () => SecurityBloc(securityUsecase: sl()),
  );
}
