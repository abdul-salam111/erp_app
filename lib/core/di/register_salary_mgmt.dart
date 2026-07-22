import '../../features/salary_mgmt/data/datasources/remote_salary_mgmt_datasource.dart';
import '../../features/salary_mgmt/data/repositories_impl/salary_mgmt_repository_impl.dart';
import '../../features/salary_mgmt/domain/repositories/salary_mgmt_repository.dart';
import '../../features/salary_mgmt/domain/usecases/salary_mgmt_usecase.dart';
import '../../features/salary_mgmt/presentation/salary_mgmt/blocs/salary_mgmt_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerSalaryMgmt() async {
  // DataSource
  sl.registerLazySingleton<IRemoteSalaryMgmtDataSource>(
    () => RemoteSalaryMgmtDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<SalaryMgmtRepository>(
    () => SalaryMgmtRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<SalaryMgmtUsecase>(
    () => SalaryMgmtUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<SalaryMgmtBloc>(
    () => SalaryMgmtBloc(salarymgmtUsecase: sl()),
  );
}
