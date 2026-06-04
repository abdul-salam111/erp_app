import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../accounts_exports.dart';
import '../datasources/remote_accounts_datasource.dart';


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
  Future<Either<Failure, List<GetLedgerModel>>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  }) {
    return execute(
      call: () => dataSource.getAccountStatements(
        fromDate: fromDate,
        toDate: toDate,
        accountId: accountId,
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
  Future<Either<Failure, List<GetLedgerModel>>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  }) {
    return execute(
      call: () => dataSource.getPartyStatements(
        fromDate: fromDate,
        toDate: toDate,
        partyId: partyId,
      ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> bankAndCashPosition() {
    return execute(
      call: () => dataSource.bankAndCashPosition(),
    );
  }
}
