import 'package:dio/dio.dart';
import '../app_exports.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  await coreDependencies();

  await authDependencies();
}

Future<void> coreDependencies() async {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton(() => DioHelper(dio: sl()));
}

/// SignIn Feature Dependencies
Future<void> authDependencies() async {
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

  // Bloc
  sl.registerFactory<SignInBloc>(() => SignInBloc(signinUsecase: sl()));
}
