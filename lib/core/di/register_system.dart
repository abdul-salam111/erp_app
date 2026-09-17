import '../../features/system/data/datasources/remote_system_datasource.dart';
import '../../features/system/data/repositories_impl/system_repository_impl.dart';
import '../../features/system/domain/repositories/system_repository.dart';
import '../../features/system/domain/usecases/system_usecase.dart';
import '../../features/system/presentation/roles/bloc/roles_bloc.dart';
import '../../features/system/presentation/system/blocs/system_bloc.dart';
import '../../features/system/presentation/users/manage_user/bloc/new_user_bloc.dart';
import '../../features/system/presentation/users/view_users/bloc/users_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerSystem() async {
  // DataSource
  sl.registerLazySingleton<IRemoteSystemDataSource>(
    () => RemoteSystemDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<SystemRepository>(
    () => SystemRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<GetUsersListUsecase>(
    () => GetUsersListUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetUserByIdUsecase>(
    () => GetUserByIdUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetLandingPageFeaturesUsecase>(
    () => GetLandingPageFeaturesUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetBranchListUsecase>(
    () => GetBranchListUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetRoleListUsecase>(
    () => GetRoleListUsecase(repository: sl()),
  );
  sl.registerLazySingleton<SaveUserUsecase>(
    () => SaveUserUsecase(repository: sl()),
  );
  sl.registerLazySingleton<DeleteUserUsecase>(
    () => DeleteUserUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<SystemBloc>(
    () => SystemBloc(),
  );
  sl.registerFactory<UsersBloc>(
    () => UsersBloc(
      getUsersListUsecase: sl(),
      deleteUserUsecase: sl(),
    ),
  );
  sl.registerFactory<NewUserBloc>(
    () => NewUserBloc(
      getUserByIdUsecase: sl(),
      getLandingPageFeaturesUsecase: sl(),
      getRoleListUsecase: sl(),
      getBranchListUsecase: sl(),
      saveUserUsecase: sl(),
    ),
  );
  sl.registerFactory<RolesBloc>(
    () => RolesBloc(getRoleListUsecase: sl()),
  );
}
