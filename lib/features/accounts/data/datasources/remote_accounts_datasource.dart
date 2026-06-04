import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../models/response_models/get_ledger/get_ledger_model.dart';
import '../models/response_models/get_due_receipt_count/due_receipt_count_model.dart';

abstract interface class IRemoteAccountsDataSource {
  Future<dynamic> performAction();
  Future<dynamic> accountLedger();
  Future<List<GetLedgerModel>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  });
  Future<String> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  });
  Future<List<int>> getPrintableFeatures();
  Future<DueReceiptCountModel> getDueReceiptCount({required String dateType});
  Future<List<GetLedgerModel>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  });
  Future<dynamic> bankAndCashPosition();
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
  Future<List<GetLedgerModel>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  }) {
    final body = <String, dynamic>{
      'FromDate': fromDate,
      'ToDate': toDate,
      'AccountId': accountId ?? 281,
    };
    return postList<GetLedgerModel>(
      url: ApiEndPoints.getLedger,
      body: body,
      parser: (json) => GetLedgerModel.fromJson(json as Map<String, dynamic>),
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

  @override
  Future<DueReceiptCountModel> getDueReceiptCount({required String dateType}) {
    return post<DueReceiptCountModel>(
      url: ApiEndPoints.getDueReceiptCount,
      body: {'DateType': dateType},
      parser: (json) =>
          DueReceiptCountModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<List<GetLedgerModel>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  }) {
    final body = <String, dynamic>{
      'FromDate': fromDate,
      'ToDate': toDate,
      'PartyId': partyId ?? 206,
    };
    return postList<GetLedgerModel>(
      url: ApiEndPoints.getLedger,
      body: body,
      parser: (json) => GetLedgerModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<dynamic> bankAndCashPosition() async {
    // TODO: implement bankAndCashPosition API call
    throw UnimplementedError('bankAndCashPosition not implemented');
  }
}
