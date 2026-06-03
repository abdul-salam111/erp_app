import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../accounts_exports.dart';
import '../../domain/repositories/accounts_repository.dart';
import '../datasources/remote_accounts_datasource.dart';
import '../models/response_models/get_due_receipt_count/due_receipt_count_model.dart';

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
  Future<Either<Failure, List<AccountLedgerModel>>> getAccountStatements({
    required String fromDate,
    required String toDate,
  }) {
    return execute(
      call: () => dataSource.getAccountStatements(
        fromDate: fromDate,
        toDate: toDate,
      ),
    );
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
  Future<Either<Failure, DueReceiptCountModel>> getDueReceiptCount({
    required String dateType,
  }) {
    return execute(
      call: () => dataSource.getDueReceiptCount(dateType: dateType),
    );
  }

  @override
  Future<Either<Failure, dynamic>> partyLedger() {
    return execute(
      call: () => dataSource.partyLedger(),
    );
  }

  @override
  Future<Either<Failure, dynamic>> bankAndCashPosition() {
    return execute(
      call: () => dataSource.bankAndCashPosition(),
    );
  }
}
