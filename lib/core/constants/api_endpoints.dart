class ApiEndPoints {
  static const baseUrl = "http://192.168.1.12:7000/api";
  static const String loginUser = "$baseUrl/mis/auth/Authlogin";
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
  // Account Statements
  static const String getAccountStatements =
      '$baseUrl/AccountStatement/GetAccountStatements';
  static const String getInvoicePdf = '$baseUrl/AccountStatement/GetInvoicePdf';
  static const String getPrintableFeatures =
      '$baseUrl/AccountStatement/GetPrintableFeatures';
}
