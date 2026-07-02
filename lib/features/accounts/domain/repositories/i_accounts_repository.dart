import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/shared_exports.dart';
import '../../accounts_exports.dart';

abstract interface class IAccountsRepository {
  //! ─── Account Ledger ─────────────────────────────────────────────────────────

  Future<Either<Failure, List<LedgerStatementEntity>>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });

  Future<Either<Failure, List<AccountListItemEntity>>> getAccountsList();

  //! ─── Party Ledger ───────────────────────────────────────────────────────────

  Future<Either<Failure, List<LedgerStatementEntity>>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  });

  Future<Either<Failure, List<PartyListItemEntity>>> getPartyList();

  //! ─── Cashbook ───────────────────────────────────────────────────────────────

  Future<Either<Failure, List<LedgerStatementEntity>>> getCashbookStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });

  Future<Either<Failure, List<CashbookAccountItemEntity>>>
  getCashbookAccounts();

  //! ─── Position ───────────────────────────────────────────────────────────────

  Future<Either<Failure, List<BankCashItemEntity>>> bankAndCashPosition();

  Future<Either<Failure, DueReceiptCountEntity>> getDueReceiptCount({
    required String dateType,
  });

  //! ─── Utilities ──────────────────────────────────────────────────────────────

  Future<Either<Failure, String>> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  });

  Future<Either<Failure, List<int>>> getPrintableFeatures();
  Future<Either<Failure, List<CustomerReceivableItemEntity>>> vendorPayable();

  //! ─── Credit Management ──────────────────────────────────────────────────────

  Future<Either<Failure, CustomerReceivableAgingEntity>>
  getCustomerReceivableAging({required String toDate, int? partyId});
}
