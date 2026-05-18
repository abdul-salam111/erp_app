import '../../features/auth/auth_exports.dart';
import 'app_dependencies.dart';

Future<void> registerAuth() async {
  // DataSource
  sl.registerLazySingleton<IAuthRemoteDatasource>(
    () => IAuthRemoteDatasourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<IAuthRepostiory>(
    () => AuthRepositoryImpl(dataSource: sl()),
  );

  // UseCase
  sl.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(repository: sl()),
  );
}
