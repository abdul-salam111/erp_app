import '../../accounts_exports.dart';

abstract interface class IRemoteAccountsDataSource {
  Future<List<GetLedgerModel>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });
  Future<String> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  });
  Future<List<int>> getPrintableFeatures();
  Future<DueReceiptCountModel> getDueReceiptCount({required String dateType});
  Future<List<GetLedgerModel>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  });
  Future<List<BankCashItemModel>> bankAndCashPosition();
  Future<List<AccountListItemModel>> getAccountsList();
  Future<List<PartyListItemModel>> getPartyList();
  Future<dynamic> cashbook();
  Future<List<GetLedgerModel>> getCashbookStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });
  Future<List<CashbookAccountModel>> getCashbookAccounts();
  Future<dynamic> creditManagement();
}
