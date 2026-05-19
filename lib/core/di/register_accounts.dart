import '../../features/accounts/data/datasources/remote_accounts_datasource.dart';
import '../../features/accounts/data/repositories_impl/accounts_repository_impl.dart';
import '../../features/accounts/domain/repositories/accounts_repository.dart';
import '../../features/accounts/domain/usecases/accounts_usecase.dart';
import '../../features/accounts/presentation/accounts/blocs/accounts_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerAccounts() async {
  // DataSource
  sl.registerLazySingleton<IRemoteAccountsDataSource>(
    () => RemoteAccountsDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<AccountsRepository>(
    () => AccountsRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<AccountsUsecase>(
    () => AccountsUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<AccountsBloc>(
    () => AccountsBloc(accountsUsecase: sl()),
  );
}
