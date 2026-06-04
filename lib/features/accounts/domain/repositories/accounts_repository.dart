import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../data/models/response_models/get_ledger/get_ledger_model.dart';
import '../../data/models/response_models/get_due_receipt_count/due_receipt_count_model.dart';

abstract interface class AccountsRepository {
  Future<Either<Failure, dynamic>> performAction();
  Future<Either<Failure, dynamic>> accountLedger();
  Future<Either<Failure, List<GetLedgerModel>>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });
  Future<Either<Failure, String>> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  });
  Future<Either<Failure, List<int>>> getPrintableFeatures();
  Future<Either<Failure, DueReceiptCountModel>> getDueReceiptCount({
    required String dateType,
  });
  Future<Either<Failure, List<GetLedgerModel>>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  });
  Future<Either<Failure, dynamic>> bankAndCashPosition();
}
