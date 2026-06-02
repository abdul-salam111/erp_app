class ApiEndPoints {
  static const baseUrl = "https://erpstagingapi.manticapps.com/api";
  static const String loginUser = "$baseUrl/mis/auth/Authlogin";
  static const String selectBranch = '$baseUrl/mis/Auth/SelectBranch';
  static const String signupUser = "${baseUrl}user/signinUid";
  static const String alertPanel = '${baseUrl}alert_panel';
  static const String purchaseOrder = '${baseUrl}purchase_order';
  static const String saleOrder = '${baseUrl}sale_order';
  static const String scanDocument = '${baseUrl}scan_document';
  static const String accounts = '${baseUrl}accounts';
  static const String inventory = '${baseUrl}inventory';
  static const String production = '${baseUrl}production';
  static const String analytics = '${baseUrl}analytics';
  static const String security = '${baseUrl}security';
  static const String dashboard = '${baseUrl}dashboard';
  static const String getDailyStats = '$baseUrl/core/MBLDashboard/GetDailyStatistics';
  static const String getMonthlyStats =
      '$baseUrl/core/MBLDashboard/GetMonthlyStatistics';
  static const String getMonthlyStatsDetail =
      '$baseUrl/core/MBLDashboard/GetMonthlyStatisticsDetail';
  static const String getSalesOrderSummaryByParty = '$baseUrl/core/MBLDashboard/GetSaleOrderSummaryByParty';
  // Account Statements
  static const String getAccountStatements =
      '$baseUrl/AccountStatement/GetAccountStatements';
  static const String getInvoicePdf = '$baseUrl/AccountStatement/GetInvoicePdf';
  static const String getPrintableFeatures =
      '$baseUrl/AccountStatement/GetPrintableFeatures';
  static const String getDueReceiptCount =
      '$baseUrl/core/MBLDashboard/GetDueReceiptCount';
  static const String getStockReceived =
      '$baseUrl/core/MBLDashboard/GetStockReceived';
  static const String getCurrentStock =
      '$baseUrl/core/MBLDashboard/GetCurrentStock';
}
