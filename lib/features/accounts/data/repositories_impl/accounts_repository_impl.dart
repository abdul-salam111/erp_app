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
    return result.map((models) => models.map((m) => m.toEntity()).toList());
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
    return result.map((models) => models.map((m) => m.toEntity()).toList());
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
    return result.map((models) => models.map((m) => m.toEntity()).toList());
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



  @override
  Future<Either<Failure, List<CustomerReceivableItemEntity>>> vendorPayable() {
    return execute(
      call: () => Future.delayed(
        const Duration(seconds: 1),
        () => <CustomerReceivableItemEntity>[
          const CustomerReceivableItemEntity(
            partyName: 'Alpha Suppliers',
            location: 'Karachi',
            opening: 15000,
            openingIsDr: false,
            debit: 5000,
            credit: 20000,
            balance: 10000,
            balanceIsDr: false,
          ),
          const CustomerReceivableItemEntity(
            partyName: 'Beta Trading Co.',
            location: 'Lahore',
            opening: 8000,
            openingIsDr: false,
            debit: 2000,
            credit: 12000,
            balance: 2000,
            balanceIsDr: false,
          ),
        ],
      ),
    );
  }
}