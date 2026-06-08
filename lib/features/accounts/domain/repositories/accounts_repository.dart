import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/account_list_item_entity.dart';
import '../entities/bank_cash_item_entity.dart';
import '../entities/cashbook_account_item_entity.dart';
import '../entities/cashbook_statement_entity.dart';
import '../entities/due_receipt_count_entity.dart';
import '../entities/ledger_statement_entity.dart';
import '../entities/party_list_item_entity.dart';

abstract interface class AccountsRepository {
  Future<Either<Failure, dynamic>> performAction();
  Future<Either<Failure, dynamic>> accountLedger();
  Future<Either<Failure, List<LedgerStatementEntity>>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });
  Future<Either<Failure, String>> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  });
  Future<Either<Failure, List<int>>> getPrintableFeatures();
  Future<Either<Failure, DueReceiptCountEntity>> getDueReceiptCount({
    required String dateType,
  });
  Future<Either<Failure, List<LedgerStatementEntity>>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  });
  Future<Either<Failure, List<BankCashItemEntity>>> bankAndCashPosition();
  Future<Either<Failure, List<AccountListItemEntity>>> getAccountsList();
  Future<Either<Failure, List<PartyListItemEntity>>> getPartyList();
  Future<Either<Failure, dynamic>> cashbook();
  Future<Either<Failure, List<CashbookStatementEntity>>> getCashbookStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });
  Future<Either<Failure, List<CashbookAccountItemEntity>>> getCashbookAccounts();
}
