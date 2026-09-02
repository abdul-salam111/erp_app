import '../../features/auth/auth_exports.dart';
import 'app_dependencies.dart';

Future<void> registerAuth() async {
  // DataSource
  sl.registerLazySingleton<IAuthRemoteDatasource>(
    () => IAuthRemoteDatasourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(repository: sl()),
  );
  sl.registerLazySingleton<SelectBranchUsecase>(
    () => SelectBranchUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetUserFeaturesUsecase>(
    () => GetUserFeaturesUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetUserRolesUsecase>(
    () => GetUserRolesUsecase(repository: sl()),
  );
  sl.registerLazySingleton<DeleteTokenUsecase>(
    () => DeleteTokenUsecase(repository: sl()),
  );

  // Blocs
  sl.registerFactory<SignInBloc>(
    () => SignInBloc(
      signinUsecase: sl(),
      selectBranchUsecase: sl(),
      getUserFeaturesUsecase: sl(),
      getUserRolesUsecase: sl(),
    ),
  );
  sl.registerFactory<BranchSelectionBloc>(
    () => BranchSelectionBloc(
      selectBranchUsecase: sl(),
      getUserFeaturesUsecase: sl(),
      getUserRolesUsecase: sl(),
    ),
  );
}
