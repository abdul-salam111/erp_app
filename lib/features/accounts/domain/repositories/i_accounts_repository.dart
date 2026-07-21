import '../../../../core/utils/result.dart';

import '../../accounts_exports.dart';

abstract interface class IAccountsRepository {
  //! ─── Account Ledger ─────────────────────────────────────────────────────────

  Future<Result<List<LedgerStatementEntity>>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });

  Future<Result<List<AccountListItemEntity>>> getAccountsList();

  //! ─── Party Ledger ───────────────────────────────────────────────────────────

  Future<Result<List<LedgerStatementEntity>>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  });

  Future<Result<List<PartyListItemEntity>>> getPartyList();

  //! ─── Cashbook ───────────────────────────────────────────────────────────────

  Future<Result<List<LedgerStatementEntity>>> getCashbookStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });

  Future<Result<List<CashbookAccountItemEntity>>>
  getCashbookAccounts();

  //! ─── Position ───────────────────────────────────────────────────────────────

  Future<Result<List<BankCashItemEntity>>> bankAndCashPosition();

  Future<Result<DueReceiptCountEntity>> getDueReceiptCount({
    required String dateType,
  });

  //! ─── Utilities ──────────────────────────────────────────────────────────────

  Future<Result<String>> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  });

  Future<Result<List<int>>> getPrintableFeatures();
  Future<Result<List<CustomerReceivableItemEntity>>> vendorPayable({
    required String fromDate,
    required String toDate,
  });

  //! ─── Credit Management ──────────────────────────────────────────────────────

  Future<Result<CustomerReceivableAgingEntity>>
  getCustomerReceivableAging({required String toDate, int? partyId});

  Future<Result<List<PartyCreditMonthlySummaryEntity>>>
  getPartyCreditMonthlySummary({
    required String toDate,
    required int partyId,
  });

  Future<Result<List<PartyUnpaidDebitEntity>>> getPartyUnpaidDebits({
    required String toDate,
    required int partyId,
  });

  Future<Result<List<PartyTopReceiptEntity>>> getPartyTopReceipts({
    required String toDate,
    required int partyId,
  });

  Future<Result<PartyRevenueAndRecoveryEntity>>
  getPartyRevenueAndRecovery({
    required String toDate,
    required int partyId,
  });

  //! ─── Customer Receivables ───────────────────────────────────────────────────

  Future<Result<List<CustomerReceivableItemEntity>>>
  getCustomerReceivables({
    required String fromDate,
    required String toDate,
  });
}
