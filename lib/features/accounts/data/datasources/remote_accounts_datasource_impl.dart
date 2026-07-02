import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../../accounts_exports.dart';

class RemoteAccountsDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteAccountsDataSource {
  RemoteAccountsDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  //! ─── Account Ledger ─────────────────────────────────────────────────────────

  @override
  Future<List<GetLedgerModel>> getAccountStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  }) {
    final body = <String, dynamic>{
      'FromDate': fromDate,
      'ToDate': toDate,
      if (accountId != null) 'AccountId': accountId,
    };
    return postList<GetLedgerModel>(
      url: ApiEndPoints.accounts.accountLedger,
      body: body,
      parser: (json) => GetLedgerModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<List<AccountListItemModel>> getAccountsList() {
    return postList<AccountListItemModel>(
      url: ApiEndPoints.accounts.accountList,
      body: {},
      parser: (json) =>
          AccountListItemModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  //! ─── Party Ledger ───────────────────────────────────────────────────────────

  @override
  Future<List<GetLedgerModel>> getPartyStatements({
    required String fromDate,
    required String toDate,
    int? partyId,
  }) {
    final body = <String, dynamic>{
      'FromDate': fromDate,
      'ToDate': toDate,
      if (partyId != null) 'PartyId': partyId,
    };
    return postList<GetLedgerModel>(
      url: ApiEndPoints.accounts.accountLedger,
      body: body,
      parser: (json) => GetLedgerModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<List<PartyListItemModel>> getPartyList() {
    return postList<PartyListItemModel>(
      url: ApiEndPoints.accounts.partyList,
      body: {},
      parser: (json) =>
          PartyListItemModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  //! ─── Cashbook ───────────────────────────────────────────────────────────────
  @override
  Future<List<GetLedgerModel>> getCashbookStatements({
    required String fromDate,
    required String toDate,
    int? accountId,
  }) {
    final body = <String, dynamic>{
      'FromDate': fromDate,
      'ToDate': toDate,
      'AccountId': accountId,
      'LedgerType': 'cash_ledger',
    };
    return postList<GetLedgerModel>(
      url: ApiEndPoints.accounts.accountLedger,
      body: body,
      parser: (json) => GetLedgerModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<List<CashbookAccountModel>> getCashbookAccounts() {
    return postList<CashbookAccountModel>(
      url: ApiEndPoints.accounts.accountList,
      body: const {},
      parser: (json) =>
          CashbookAccountModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  //! ─── Position ───────────────────────────────────────────────────────────────

  @override
  Future<List<BankCashItemModel>> bankAndCashPosition() {
    return postList<BankCashItemModel>(
      url: ApiEndPoints.dashboard.cashAndBankBalance,
      body: {},
      parser: (json) =>
          BankCashItemModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<DueReceiptCountModel> getDueReceiptCount({required String dateType}) {
    return post<DueReceiptCountModel>(
      url: ApiEndPoints.dashboard.dueReceiptCount,
      body: {'DateType': dateType},
      parser: (json) =>
          DueReceiptCountModel.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  //! ─── Utilities ──────────────────────────────────────────────────────────────

  @override
  Future<String> getInvoicePdf({
    required int featureId,
    required int parentEntityId,
  }) {
    return post<String>(
      url: ApiEndPoints.accounts.invoicePdf,
      body: {'FeatureId': featureId, 'ParentEntityId': parentEntityId},
      parser: (json) => (json as Map<String, dynamic>)['URL'] as String,
      authToken: _token,
    );
  }

  @override
  Future<List<int>> getPrintableFeatures() {
    return getList<int>(
      url: ApiEndPoints.accounts.printableFeatures,
      parser: (json) => json as int,
      authToken: _token,
    );
  }
}