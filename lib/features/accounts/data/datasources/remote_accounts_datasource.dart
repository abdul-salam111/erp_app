import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../models/response_models/get_ledger/account_ledger_model.dart';

abstract interface class IRemoteAccountsDataSource {
  Future<dynamic> performAction();
  Future<dynamic> accountLedger();
  Future<List<AccountLedgerModel>> getAccountStatements({
    required String fromDate,
    required String toDate,
  });
  Future<String> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  });
  Future<List<int>> getPrintableFeatures();
}

class RemoteAccountsDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteAccountsDataSource {
  RemoteAccountsDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.accounts,
      parser: (json) => json,
      body: {},
    );
  }

  @override
  Future<dynamic> accountLedger() async {
    throw UnimplementedError('accountLedger not implemented');
  }

  @override
  Future<List<AccountLedgerModel>> getAccountStatements({
    required String fromDate,
    required String toDate,
  }) {
    return postList<AccountLedgerModel>(
      url: ApiEndPoints.getAccountStatements,
      body: {'FromDate': fromDate, 'ToDate': toDate},
      parser: (json) =>
          AccountLedgerModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<String> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  }) {
    return post<String>(
      url: ApiEndPoints.getInvoicePdf,
      body: {'FeatureId': featureId, 'ParentEntityId': parentEntityId},
      parser: (json) => (json as Map<String, dynamic>)['URL'] as String,
      authToken: _token,
    );
  }

  @override
  Future<List<int>> getPrintableFeatures() {
    return getList<int>(
      url: ApiEndPoints.getPrintableFeatures,
      parser: (json) => json as int,
      authToken: _token,
    );
  }
}
