import '../../features/leaves/data/datasources/remote_leaves_datasource.dart';
import '../../features/leaves/data/repositories_impl/leaves_repository_impl.dart';
import '../../features/leaves/domain/repositories/leaves_repository.dart';
import '../../features/leaves/domain/usecases/leaves_usecase.dart';
import '../../features/leaves/domain/usecases/apply_leave_usecase.dart';
import '../../features/leaves/domain/usecases/get_leave_balances_usecase.dart';
import '../../features/leaves/domain/usecases/get_leave_by_id_usecase.dart';
import '../../features/leaves/presentation/leaves/blocs/leaves_bloc.dart';
import '../../features/leaves/presentation/apply_leave/blocs/apply_leave_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerLeaves() async {
  // DataSource
  sl.registerLazySingleton<IRemoteLeavesDataSource>(
    () => RemoteLeavesDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<LeavesRepository>(
    () => LeavesRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<LeavesUsecase>(
    () => LeavesUsecase(repository: sl()),
  );
  sl.registerLazySingleton<ApplyLeaveUsecase>(
    () => ApplyLeaveUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetLeaveBalancesUsecase>(
    () => GetLeaveBalancesUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetLeaveByIdUsecase>(
    () => GetLeaveByIdUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<LeavesBloc>(
    () => LeavesBloc(leavesUsecase: sl()),
  );
  sl.registerFactory<ApplyLeaveBloc>(
    () => ApplyLeaveBloc(applyLeaveUsecase: sl()),
  );
}
