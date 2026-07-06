import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../accounts_exports.dart';

class AccountsRepositoryImpl extends BaseRepository
    implements IAccountsRepository {
  AccountsRepositoryImpl({required this.dataSource});

  final IRemoteAccountsDataSource dataSource;

  //! ─── Account Ledger ─────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, List<LedgerStatementEntity>>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  }) async {
    final result = await execute(
      call: () => dataSource.getAccountStatements(
        fromDate: fromDate,
        toDate: toDate,
        accountId: accountId,
      ),
    );
    return result.map((model) => [model.toEntity()]);
  }

  @override
  Future<Either<Failure, List<AccountListItemEntity>>> getAccountsList() async {
    final result = await execute(call: () => dataSource.getAccountsList());
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  //! ─── Party Ledger ───────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, List<LedgerStatementEntity>>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  }) async {
    final result = await execute(
      call: () => dataSource.getPartyStatements(
        fromDate: fromDate,
        toDate: toDate,
        partyId: partyId,
      ),
    );
    return result.map((model) => [model.toEntity()]);
  }

  @override
  Future<Either<Failure, List<PartyListItemEntity>>> getPartyList() async {
    final result = await execute(call: () => dataSource.getPartyList());
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  //! ─── Cashbook ───────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, List<LedgerStatementEntity>>> getCashbookStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  }) async {
    final result = await execute(
      call: () => dataSource.getCashbookStatements(
        fromDate: fromDate,
        toDate: toDate,
        accountId: accountId,
      ),
    );
    return result.map((model) => [model.toEntity()]);
  }

  @override
  Future<Either<Failure, List<CashbookAccountItemEntity>>>
  getCashbookAccounts() async {
    final result = await execute(call: () => dataSource.getCashbookAccounts());
    return result.map(
      (models) => models.map((m) => m.toCashbookEntity()).toList(),
    );
  }

  //! ─── Position ───────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, List<BankCashItemEntity>>>
  bankAndCashPosition() async {
    final result = await execute(call: () => dataSource.bankAndCashPosition());
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, DueReceiptCountEntity>> getDueReceiptCount({
    required String dateType,
  }) async {
    final result = await execute(
      call: () => dataSource.getDueReceiptCount(dateType: dateType),
    );
    return result.map((model) => model.toEntity());
  }

  //! ─── Utilities ──────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, String>> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  }) {
    return execute(
      call: () => dataSource.getInvoicePdf(
        featureId: featureId,
        parentEntityId: parentEntityId,
      ),
    );
  }

  @override
  Future<Either<Failure, List<int>>> getPrintableFeatures() {
    return execute(call: () => dataSource.getPrintableFeatures());
  }



  //! ─── Credit Management ──────────────────────────────────────────────────────

  @override
  Future<Either<Failure, CustomerReceivableAgingEntity>>
  getCustomerReceivableAging({
    required String toDate,
    int? partyId,
  }) async {
    final result = await execute(
      call: () => dataSource.getCustomerReceivableAging(
        toDate: toDate,
        partyId: partyId,
      ),
    );
    return result.map((m) => m.toEntity());
  }

  @override
  Future<Either<Failure, List<PartyCreditMonthlySummaryEntity>>>
  getPartyCreditMonthlySummary({
    required String toDate,
    required int partyId,
  }) async {
    final result = await execute(
      call: () => dataSource.getPartyCreditMonthlySummary(
        toDate: toDate,
        partyId: partyId,
      ),
    );
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<PartyUnpaidDebitEntity>>> getPartyUnpaidDebits({
    required String toDate,
    required int partyId,
  }) async {
    final result = await execute(
      call: () => dataSource.getPartyUnpaidDebits(
        toDate: toDate,
        partyId: partyId,
      ),
    );
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<PartyTopReceiptEntity>>> getPartyTopReceipts({
    required String toDate,
    required int partyId,
  }) async {
    final result = await execute(
      call: () => dataSource.getPartyTopReceipts(
        toDate: toDate,
        partyId: partyId,
      ),
    );
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, PartyRevenueAndRecoveryEntity>>
  getPartyRevenueAndRecovery({
    required String toDate,
    required int partyId,
  }) async {
    final result = await execute(
      call: () => dataSource.getPartyRevenueAndRecovery(
        toDate: toDate,
        partyId: partyId,
      ),
    );
    return result.map((m) => m.toEntity());
  }

  //! ─── Customer Receivables ───────────────────────────────────────────────────

  @override
  Future<Either<Failure, List<CustomerReceivableItemEntity>>>
  getCustomerReceivables({
    required String fromDate,
    required String toDate,
  }) async {
    final result = await execute(
      call: () => dataSource.getPartyBalanceDetail(
        flgReceivable: true,
        fromDate: fromDate,
        toDate: toDate,
        reportType: 'customer_receivables',
      ),
    );
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<CustomerReceivableItemEntity>>> vendorPayable({
    required String fromDate,
    required String toDate,
  }) async {
    final result = await execute(
      call: () => dataSource.getPartyBalanceDetail(
        flgPayable: true,
        fromDate: fromDate,
        toDate: toDate,
      ),
    );
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }
}