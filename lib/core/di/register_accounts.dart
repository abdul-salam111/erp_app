import '../../features/accounts/data/datasources/remote_accounts_datasource.dart';
import '../../features/accounts/data/repositories_impl/accounts_repository_impl.dart';
import '../../features/accounts/domain/repositories/accounts_repository.dart';
import '../../features/accounts/domain/usecases/get_account_statements_usecase.dart';
import '../../features/accounts/domain/usecases/get_cashbook_accounts_usecase.dart';
import '../../features/accounts/domain/usecases/get_cashbook_statements_usecase.dart';
import '../../features/accounts/domain/usecases/get_invoice_pdf_usecase.dart';
import '../../features/accounts/domain/usecases/get_printable_features_usecase.dart';
import '../../features/accounts/domain/usecases/get_due_receipt_count_usecase.dart';
import '../../features/accounts/presentation/accounts/blocs/accounts_bloc.dart';
import '../../features/accounts/presentation/account_ledger/blocs/account_ledger_bloc.dart';
import 'app_dependencies.dart';
import '../../features/accounts/domain/usecases/get_party_statements_usecase.dart';
import '../../features/accounts/presentation/party_ledger/blocs/party_ledger_bloc.dart';
import '../../features/accounts/domain/usecases/bank_and_cash_position_usecase.dart';
import '../../features/accounts/domain/usecases/get_accounts_list_usecase.dart';
import '../../features/accounts/domain/usecases/get_party_list_usecase.dart';
import '../../features/accounts/presentation/bank_and_cash_position/blocs/bank_and_cash_position_bloc.dart';
import '../../features/accounts/presentation/cashbook/blocs/cashbook_bloc.dart';

Future<void> registerAccounts() async {
  // DataSource
  sl.registerLazySingleton<IRemoteAccountsDataSource>(
    () => RemoteAccountsDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<AccountsRepository>(
    () => AccountsRepositoryImpl(dataSource: sl()),
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
  sl.registerLazySingleton<GetAccountsListUsecase>(
    () => GetAccountsListUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetPartyListUsecase>(
    () => GetPartyListUsecase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<AccountsBloc>(
    () => AccountsBloc(getDueReceiptCountUsecase: sl()),
  );
  sl.registerFactory<AccountLedgerBloc>(
    () => AccountLedgerBloc(
      getAccountStatementsUsecase: sl(),
      getInvoicePdfUsecase: sl(),
      getAccountsListUsecase: sl(),
    ),
  );
  // UseCase — PartyLedger
  sl.registerLazySingleton<GetPartyStatementsUsecase>(
    () => GetPartyStatementsUsecase(repository: sl()),
  );
  // BLoC — PartyLedger screen
  sl.registerFactory<PartyLedgerBloc>(
    () => PartyLedgerBloc(
      getPartyStatementsUsecase: sl(),
      getInvoicePdfUsecase: sl(),
      getPartyListUsecase: sl(),
    ),
  );
  // UseCase — BankAndCashPosition
  sl.registerLazySingleton<BankAndCashPositionUsecase>(
    () => BankAndCashPositionUsecase(repository: sl()),
  );
  // BLoC — BankAndCashPosition screen
  sl.registerFactory<BankAndCashPositionBloc>(
    () => BankAndCashPositionBloc(bankAndCashPositionUsecase: sl()),
  );
  // UseCases — Cashbook screen
  sl.registerLazySingleton<GetCashbookStatementsUsecase>(
    () => GetCashbookStatementsUsecase(repository: sl()),
  );
  sl.registerLazySingleton<GetCashbookAccountsUsecase>(
    () => GetCashbookAccountsUsecase(repository: sl()),
  );
  // BLoC — Cashbook screen
  sl.registerFactory<CashbookBloc>(
    () => CashbookBloc(
      getCashbookStatementsUsecase: sl(),
      getInvoicePdfUsecase:         sl(),
      getCashbookAccountsUsecase:   sl(),
    ),
  );
}
