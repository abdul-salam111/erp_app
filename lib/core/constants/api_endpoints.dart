class ApiEndPoints {
  static const String _base = 'https://erpstagingapi.manticapps.com/api';

  static const auth       = _Auth();
  static const dashboard  = _Dashboard();
  static const accounts   = _Accounts();
  static const modules    = _Modules();
}

// ─── Auth ───────────────────────────────────────────────────────────────────

final class _Auth {
  const _Auth();

  static const String _base = '${ApiEndPoints._base}/mis';

  String get login        => '$_base/auth/Authlogin';
  String get selectBranch => '$_base/Auth/SelectBranch';
  String get signup       => '${ApiEndPoints._base}/user/signinUid';
}

// ─── Dashboard ──────────────────────────────────────────────────────────────

final class _Dashboard {
  const _Dashboard();

  static const String _base = '${ApiEndPoints._base}/ExecutiveApp/dashboard';

  String get dailyStats               => '$_base/GetDailyStatistics';
  String get monthlyStats             => '$_base/GetMonthlyStatistics';
  String get monthlyStatsDetail       => '$_base/GetMonthlyStatisticsDetail';
  String get salesOrderSummaryByParty => '$_base/GetSaleOrderSummaryByParty';
  String get dueReceiptCount          => '$_base/GetDueReceipts';
  String get stockReceived            => '$_base/GetStockReceived';
  String get currentStock             => '$_base/GetCurrentStock';
  String get cashAndBankBalance       => '$_base/GetCashAndBankBalance';
}

// ─── Accounts / Party ───────────────────────────────────────────────────────

final class _Accounts {
  const _Accounts();

  static const String _execBase      = '${ApiEndPoints._base}/ExecutiveApp';
  static const String _statementsBase = '${ApiEndPoints._base}/AccountStatement';

  String get accountList              => '$_execBase/accounts/GetList';
  String get accountLedger            => '$_execBase/accounts/GetLedger';
  String get partyList                => '$_execBase/party/GetList';
  String get customerReceivableAging  => '$_execBase/creditmanagement/GetCustomerReceivableAging';
  String get statements        => '$_statementsBase/GetAccountStatements';
  String get invoicePdf        => '$_statementsBase/GetInvoicePdf';
  String get printableFeatures => '$_statementsBase/GetPrintableFeatures';
}

// ─── Modules (legacy placeholders) ──────────────────────────────────────────

final class _Modules {
  const _Modules();

  static const String _base = ApiEndPoints._base;

  String get alertPanel    => '${_base}alert_panel';
  String get purchaseOrder => '${_base}purchase_order';
  String get saleOrder     => '${_base}sale_order';
  String get scanDocument  => '${_base}scan_document';
  String get accounts      => '${_base}accounts';
  String get inventory     => '${_base}inventory';
  String get production    => '${_base}production';
  String get analytics     => '${_base}analytics';
  String get security      => '${_base}security';
  String get dashboard     => '${_base}dashboard';
}
