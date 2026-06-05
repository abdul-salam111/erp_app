import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/account_list_item_entity.dart';
import '../../domain/entities/bank_cash_item_entity.dart';
import '../../domain/entities/due_receipt_count_entity.dart';
import '../../domain/entities/ledger_statement_entity.dart';
import '../../domain/entities/party_list_item_entity.dart';
import '../../domain/repositories/accounts_repository.dart';
import '../datasources/remote_accounts_datasource.dart';
import '../mappers/accounts_mappers.dart';

class AccountsRepositoryImpl extends BaseRepository
    implements AccountsRepository {
  final IRemoteAccountsDataSource dataSource;

  AccountsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(call: () => dataSource.performAction());
  }

  @override
  Future<Either<Failure, dynamic>> accountLedger() {
    return execute(call: () => dataSource.accountLedger());
  }

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
  Future<Either<Failure, DueReceiptCountEntity>> getDueReceiptCount({
    required String dateType,
  }) async {
    final result = await execute(
      call: () => dataSource.getDueReceiptCount(dateType: dateType),
    );
    return result.map((model) => model.toEntity());
  }

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
  Future<Either<Failure, List<BankCashItemEntity>>> bankAndCashPosition() async {
    final result = await execute(call: () => dataSource.bankAndCashPosition());
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<AccountListItemEntity>>> getAccountsList() async {
    final result = await execute(call: () => dataSource.getAccountsList());
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<PartyListItemEntity>>> getPartyList() async {
    final result = await execute(call: () => dataSource.getPartyList());
    return result.map((models) => models.map((m) => m.toEntity()).toList());
  }
}
