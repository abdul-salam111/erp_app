import '../../accounts_exports.dart';

abstract interface class IRemoteAccountsDataSource {
  //! ─── Account Ledger ─────────────────────────────────────────────────────────

  Future<List<GetLedgerModel>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });

  Future<List<AccountListItemModel>> getAccountsList();

  //! ─── Party Ledger ───────────────────────────────────────────────────────────

  Future<List<GetLedgerModel>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  });

  Future<List<PartyListItemModel>> getPartyList();

  //! ─── Cashbook ───────────────────────────────────────────────────────────────
  Future<List<GetLedgerModel>> getCashbookStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });

  Future<List<CashbookAccountModel>> getCashbookAccounts();

  //! ─── Position ───────────────────────────────────────────────────────────────

  Future<List<BankCashItemModel>> bankAndCashPosition();

  Future<DueReceiptCountModel> getDueReceiptCount({required String dateType});

  //! ─── Utilities ──────────────────────────────────────────────────────────────

  Future<String> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  });

  Future<List<int>> getPrintableFeatures();
}