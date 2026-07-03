import '../../accounts_exports.dart';

abstract interface class IRemoteAccountsDataSource {
  //! ─── Account Ledger ─────────────────────────────────────────────────────────

  Future<GetLedgerModel> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });

  Future<List<AccountListItemModel>> getAccountsList();

  //! ─── Party Ledger ───────────────────────────────────────────────────────────

  Future<GetLedgerModel> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  });


  Future<List<PartyListItemModel>> getPartyList();

  //! ─── Cashbook ───────────────────────────────────────────────────────────────
  Future<GetLedgerModel> getCashbookStatements({
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

  //! ─── Credit Management ──────────────────────────────────────────────────────

  Future<CustomerReceivableAgingModel> getCustomerReceivableAging({
    required String toDate,
    int? partyId,
  });

  Future<List<PartyCreditMonthlySummaryModel>> getPartyCreditMonthlySummary({
    required String toDate,
    required int partyId,
  });

  Future<List<PartyUnpaidDebitModel>> getPartyUnpaidDebits({
    required String toDate,
    required int partyId,
  });

  Future<List<PartyTopReceiptModel>> getPartyTopReceipts({
    required String toDate,
    required int partyId,
  });

  Future<PartyRevenueAndRecoveryModel> getPartyRevenueAndRecovery({
    required String toDate,
    required int partyId,
  });
}