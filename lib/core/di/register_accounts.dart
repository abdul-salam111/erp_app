import '../../features/accounts/data/datasources/remote_accounts_datasource.dart';
import '../../features/accounts/data/repositories_impl/accounts_repository_impl.dart';
import '../../features/accounts/domain/repositories/accounts_repository.dart';
import '../../features/accounts/domain/usecases/accounts_usecase.dart';
import '../../features/accounts/domain/usecases/get_account_statements_usecase.dart';
import '../../features/accounts/domain/usecases/get_invoice_pdf_usecase.dart';
import '../../features/accounts/domain/usecases/get_printable_features_usecase.dart';
import '../../features/accounts/domain/usecases/get_due_receipt_count_usecase.dart';
import '../../features/accounts/presentation/accounts/blocs/accounts_bloc.dart';
import '../../features/accounts/presentation/account_ledger/blocs/account_ledger_bloc.dart';
import 'app_dependencies.dart';
import '../../features/accounts/domain/usecases/party_ledger_usecase.dart';
import '../../features/accounts/presentation/party_ledger/blocs/party_ledger_bloc.dart';
import '../../features/accounts/domain/usecases/bank_and_cash_position_usecase.dart';
import '../../features/accounts/presentation/bank_and_cash_position/blocs/bank_and_cash_position_bloc.dart';

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
  sl.registerLazySingleton<GetAccountStatementsUsecase>(
    () => GetAccountStatementsUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetInvoicePdfUsecase>(
    () => GetInvoicePdfUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetPrintableFeaturesUsecase>(
    () => GetPrintableFeaturesUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetDueReceiptCountUsecase>(
    () => GetDueReceiptCountUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<AccountsBloc>(
    () => AccountsBloc(
      accountsUsecase:          sl(),
      getDueReceiptCountUsecase: sl(),
    ),
  );
  sl.registerFactory<AccountLedgerBloc>(
    () => AccountLedgerBloc(
      getAccountStatementsUsecase: sl(),
      getInvoicePdfUsecase: sl(),
      getPrintableFeaturesUsecase: sl(),
    ),
  );
  // UseCase — PartyLedger
  sl.registerLazySingleton<PartyLedgerUsecase>(
    () => PartyLedgerUsecase(repository: sl()),
  );
  // BLoC — PartyLedger screen
  sl.registerFactory<PartyLedgerBloc>(
    () => PartyLedgerBloc(partyLedgerUsecase: sl()),
  );
  // UseCase — BankAndCashPosition
  sl.registerLazySingleton<BankAndCashPositionUsecase>(
    () => BankAndCashPositionUsecase(repository: sl()),
  );
  // BLoC — BankAndCashPosition screen
  sl.registerFactory<BankAndCashPositionBloc>(
    () => BankAndCashPositionBloc(bankAndCashPositionUsecase: sl()),
  );
}
