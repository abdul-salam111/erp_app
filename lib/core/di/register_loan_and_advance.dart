import '../../features/loan_and_advance/data/datasources/remote_loan_and_advance_datasource.dart';
import '../../features/loan_and_advance/data/repositories_impl/loan_and_advance_repository_impl.dart';
import '../../features/loan_and_advance/domain/repositories/loan_and_advance_repository.dart';
import '../../features/loan_and_advance/domain/usecases/loan_and_advance_usecase.dart';
import '../../features/loan_and_advance/domain/usecases/apply_loan_usecase.dart';
import '../../features/loan_and_advance/presentation/loan_and_advance/blocs/loan_and_advance_bloc.dart';
import '../../features/loan_and_advance/presentation/apply_loan/blocs/apply_loan_bloc.dart';
import 'app_dependencies.dart';

Future<void> registerLoanAndAdvance() async {
  // DataSource
  sl.registerLazySingleton<IRemoteLoanAndAdvanceDataSource>(
    () => RemoteLoanAndAdvanceDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<LoanAndAdvanceRepository>(
    () => LoanAndAdvanceRepositoryImpl(dataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<LoanAndAdvanceUsecase>(
    () => LoanAndAdvanceUsecase(repository: sl()),
  );
  sl.registerLazySingleton<ApplyLoanUsecase>(
    () => ApplyLoanUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<LoanAndAdvanceBloc>(
    () => LoanAndAdvanceBloc(loanAndAdvanceUsecase: sl()),
  );
  sl.registerFactory<ApplyLoanBloc>(
    () => ApplyLoanBloc(applyLoanUsecase: sl()),
  );
}
