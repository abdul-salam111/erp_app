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

  // UseCases
  sl.registerLazySingleton<SignInUsecase>(
    () => SignInUsecase(repository: sl()),
  );
  sl.registerLazySingleton<SelectBranchUsecase>(
    () => SelectBranchUsecase(repository: sl()),
  );

  // Blocs
  sl.registerFactory<SignInBloc>(
    () => SignInBloc(signinUsecase: sl(), selectBranchUsecase: sl()),
  );
  sl.registerFactory<BranchSelectionBloc>(
    () => BranchSelectionBloc(selectBranchUsecase: sl()),
  );
}
