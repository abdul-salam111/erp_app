import '../../features/auth/auth_exports.dart';
import '../../features/auth/domain/usecases/select_branch_usecase.dart';
import '../../features/auth/presentation/organization_selection/blocs/branch_selection_bloc.dart';
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
    () => SignInBloc(signinUsecase: sl()),
  );
  sl.registerFactory<BranchSelectionBloc>(
    () => BranchSelectionBloc(selectBranchUsecase: sl()),
  );
}
