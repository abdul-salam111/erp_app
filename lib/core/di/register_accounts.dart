import '../../features/accounts/accounts_exports.dart';
import '../../features/accounts/data/datasources/remote_accounts_datasource_impl.dart';
import '../../features/accounts/data/repositories_impl/accounts_repository_impl.dart';
import 'app_dependencies.dart';

Future<void> registerAccounts() async {
  // DataSource
  sl.registerLazySingleton<IRemoteAccountsDataSource>(
    () => RemoteAccountsDataSourceImpl(dioHelper: sl()),
  );

  // Repository
  sl.registerLazySingleton<IAccountsRepository>(
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
      getInvoicePdfUsecase: sl(),
      getCashbookAccountsUsecase: sl(),
    ),
  );

  // UseCase — CreditManagement
  sl.registerLazySingleton<GetCustomerReceivableAgingUsecase>(
    () => GetCustomerReceivableAgingUsecase(repository: sl()),
  );
  // BLoC — CreditManagement screen
  sl.registerFactory<CreditManagementBloc>(
    () => CreditManagementBloc(
      getPartyListUsecase: sl(),
      getCustomerReceivableAgingUsecase: sl(),
    ),
  );
  // Cubit — AcStatement tab (credit management details)
  sl.registerFactory<AcStatementCubit>(
    () => AcStatementCubit(sl<GetPartyStatementsUsecase>()),
  );
  // UseCase — PartyCreditMonthlySummary
  sl.registerLazySingleton<GetPartyCreditMonthlySummaryUsecase>(
    () => GetPartyCreditMonthlySummaryUsecase(repository: sl()),
  );
  // UseCase — PartyUnpaidDebits
  sl.registerLazySingleton<GetPartyUnpaidDebitsUsecase>(
    () => GetPartyUnpaidDebitsUsecase(repository: sl()),
  );
  // UseCase — PartyTopReceipts
  sl.registerLazySingleton<GetPartyTopReceiptsUsecase>(
    () => GetPartyTopReceiptsUsecase(repository: sl()),
  );
  // UseCase — PartyRevenueAndRecovery
  sl.registerLazySingleton<GetPartyRevenueAndRecoveryUsecase>(
    () => GetPartyRevenueAndRecoveryUsecase(repository: sl()),
  );
  // Cubit — HomeTab (credit management details: summary + unpaid + receipts + revenue)
  sl.registerFactory<CreditManagementDetailsCubit>(
    () => CreditManagementDetailsCubit(
      summaryUsecase: sl(),
      unpaidUsecase: sl(),
      receiptsUsecase: sl(),
      revenueUsecase: sl(),
    ),
  );
  // UseCase — CustomerRecievables
  sl.registerLazySingleton<CustomerRecievablesUsecase>(
    () => CustomerRecievablesUsecase(repository: sl()),
  );
  // BLoC — CustomerRecievables screen
  sl.registerFactory<CustomerRecievablesBloc>(
    () => CustomerRecievablesBloc(customerRecievablesUsecase: sl()),
  );
  // UseCase — VendorPayable
  sl.registerLazySingleton<VendorPayableUsecase>(
    () => VendorPayableUsecase(repository: sl()),
  );
  // BLoC — VendorPayable screen
  sl.registerFactory<VendorPayableBloc>(
    () => VendorPayableBloc(vendorPayableUsecase: sl()),
  );
}
