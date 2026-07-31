import '../config/app_config.dart';

class ApiEndPoints {
  static String get _base => AppConfig.instance.baseUrl;

  static const auth           = _Auth();
  static const dashboard      = _Dashboard();
  static const accounts       = _Accounts();
  static const modules        = _Modules();
  static const purchase       = _PurchaseOrders();
  static const sale           = _SaleOrders();
  static const attendance     = _Attendance();
  static const leaves         = _Leaves();
  static const salaryMgmt     = _SalaryMgmt();
  static const loanAndAdvance = _LoanAndAdvance();
  static const overtime       = _Overtime();
}

// ─── Auth ───────────────────────────────────────────────────────────────────

final class _Auth {
  const _Auth();

  static String get _execBase => '${ApiEndPoints._base}/ExecutiveApp';

  String get login        => '$_execBase/Auth/Login';
  String get selectBranch => '$_execBase/Auth/SelectBranch';
  String get signup       => '${ApiEndPoints._base}/user/signinUid';
}

// ─── Dashboard ──────────────────────────────────────────────────────────────

final class _Dashboard {
  const _Dashboard();

  static String get _base => '${ApiEndPoints._base}/ExecutiveApp/dashboard';

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

  static String get _execBase       => '${ApiEndPoints._base}/ExecutiveApp';
  static String get _statementsBase => '${ApiEndPoints._base}/AccountStatement';

  String get accountList              => '$_execBase/accounts/GetList';
  String get accountLedger            => '$_execBase/accounts/GetLedger';
  String get partyList                => '$_execBase/party/GetList';
  String get customerReceivableAging        => '$_execBase/creditmanagement/GetCustomerReceivableAging';
  String get partyCreditMonthlySummary      => '$_execBase/creditmanagement/GetPartyCreditMonthWiseSummary';
  String get partyUnpaidDebits              => '$_execBase/creditmanagement/GetPartyUnpaidDebits';
  String get partyTopReceipts               => '$_execBase/creditmanagement/GetPartyTopReceipts';
  String get partyRevenueAndRecovery        => '$_execBase/creditmanagement/GetPartyRevenueAndRecovery';
  String get partyBalanceDetail             => '$_execBase/party/GetPartyBalanceDetail';
  String get statements        => '$_statementsBase/GetAccountStatements';
  String get invoicePdf        => '$_statementsBase/GetInvoicePdf';
  String get printableFeatures => '$_statementsBase/GetPrintableFeatures';
}

final class _PurchaseOrders {
  const _PurchaseOrders();

  String get getPurchaseOrdersList => '${ApiEndPoints._base}/purchase/po/getPagedList';
  String getPurchaseOrderById(int id) => '${ApiEndPoints._base}/purchase/po/GetById/$id';
}

final class _SaleOrders {
  const _SaleOrders();

  String get getSaleOrdersList => '${ApiEndPoints._base}/sale/so/getPagedList';
  String getSaleOrderById(int id) => '${ApiEndPoints._base}/sale/so/GetById/$id';
}

// ─── Modules (legacy placeholders) ──────────────────────────────────────────

final class _Modules {
  const _Modules();

  static String get _base => ApiEndPoints._base;

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

// ─── Attendance ──────────────────────────────────────────────────────────────

final class _Attendance {
  const _Attendance();

  static String get _base => '${ApiEndPoints._base}/attendance';

  String get getAttendance => '$_base/GetAttendance';
}

// ─── Leaves ──────────────────────────────────────────────────────────────────

final class _Leaves {
  const _Leaves();

  static String get _base => '${ApiEndPoints._base}/leaves';

  String get applyLeave => '$_base/ApplyLeave';
  String get getLeaves  => '$_base/GetLeaves';
}

// ─── Salary Management ────────────────────────────────────────────────────────

final class _SalaryMgmt {
  const _SalaryMgmt();

  static String get _base => '${ApiEndPoints._base}/salary';

  String get getSalary => '$_base/GetSalary';
}

// ─── Loan and Advance ─────────────────────────────────────────────────────────

final class _LoanAndAdvance {
  const _LoanAndAdvance();

  static String get _base => '${ApiEndPoints._base}/loan-and-advance';

  String get getLoans  => '$_base/GetLoans';
  String get applyLoan => '$_base/ApplyLoan';
}

// ─── Overtime ─────────────────────────────────────────────────────────────────

final class _Overtime {
  const _Overtime();

  static String get _base => '${ApiEndPoints._base}/overtime';

  String get getOvertime   => '$_base/GetOvertime';
  String get applyOvertime => '$_base/ApplyOvertime';
}
