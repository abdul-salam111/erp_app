class ApiEndPoints {
  static const baseUrl = "http://desktop-a42b3hq:7000/api/mis/";
  static const String loginUser =
      "${baseUrl}auth/login?email=tayyabb_Staging@bahooricemills.com&password=uZbLHbeVea";
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
}
