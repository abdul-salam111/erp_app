import 'dart:core';

class AppConstants {

  // ─── Auth ──────────────────────────────────────────────
  static const String signInTitle = 'Sign In';
  static const String youHaveLoggedinSuccessfully = 'You have loggedin successfully!';
  static const String emailLabel = 'Email';
  static const String enterYourEmailHint = 'Enter your email';
  static const String passwordLabel = 'Password';
  static const String enterYourPasswordHint = 'Enter your password';
  static const String signInBtn = 'SignIn';

  // ─── Dashboard ─────────────────────────────────────────
  static const String adminDashboardTitle = 'Admin Dashboard';
  static const String admin = 'Bahoo Foods';
  static const String recoveryDueTodayLabel = 'Recovery due today';
  static const String receivedTodayLabel = 'Received today';
  static const String expensesTodayLabel = 'Expenses today';
  static const String purchasesTodayLabel = 'Purchases today';
  static const String paymentsToMakeLabel = 'Payments to make';
  static const String paymentsMadeLabel = 'Payments made';
  static const String salesTodayLabel = 'Sales today';
  static const String newOrdersLabel = 'New orders';
  static const String todaySOverview = 'Today\'s Overview';
  static const String showLess = 'Show less';
  static const String showMore = 'Show more';
  static const String rs0 = 'Rs 0';
  static const String abbasLabourContractor = 'Abbas Labour Contractor';
  static const String abdullahENGOkara = 'Abdullah ENG Okara M. Sarwar';
  static const String cornFlour = 'Corn Flour';
  static const String newOrders = 'New Orders';
  static const String viewAll = 'View all';
  static const String administrator = 'Administrator';
  static const String dashboardLabel = 'Dashboard';
  static const String scanDocumentLabel = 'Scan Document';
  static const String modules = 'Modules';
  static const String accountsLabel = 'Accounts';
  static const String inventoryLabel = 'Inventory';
  static const String purchaseLabel = 'Purchase';
  static const String salesLabel = 'Sales';
  static const String productionLabel = 'Production';
  static const String analyticsLabel = 'Analytics';
  static const String securityLabel = 'Security';
  static const String systemLabel = 'System';
  static const String assetsLabel = 'Assets';
  static const String logout = 'Logout';
  static const String goodMorning = 'Good Morning';
  static const String goodAfternoon = 'Good Afternoon';
  static const String goodEveningMsg = 'Good Evening';
  static const String eRPDashboard = 'Mantic ERP';
  static const String expensesLabel = 'Expenses';
  static const String rs6110 = 'Rs 6,110';
  static const String change84Percent = '84 %';
  static const String changeMinus250Percent = '-250 %';
  static const String newClientsLabel = 'New Clients';
  static const String changeMinus100Percent = '-100 %';
  static const String totalRevenueLabel = 'Total Revenue';
  static const String rs503100Label = 'Rs 503,100';
  static const String totalPurchasesLabel = 'Total Purchases';
  static const String rs6300Label = 'Rs 6,300';
  static const String recoveriesLabel = 'Recoveries';
  static const String monthOverview = 'Month Overview';
  static const String may2026 = 'May 2026';
  static const String quickActionsTitle = 'Quick Actions';
  static const String menu1Label = 'Menu 1';
  static const String menu2Label = 'Menu 2';
  static const String menu3Label = 'Menu 3';
  static const String jan = 'Jan';
  static const String feb = 'Feb';
  static const String mar = 'Mar';
  static const String apr = 'Apr';
  static const String may = 'May';
  static const String jun = 'Jun';
  static const String jul = 'Jul';
  static const String aug = 'Aug';
  static const String sep = 'Sep';
  static const String oct = 'Oct';
  static const String nov = 'Nov';
  static const String dec = 'Dec';
  static const String stats = 'Stats';
  static const String janMar = 'Jan - Mar';
  static const String inCompleteOnly = 'In-complete only';
  static const String completedOnly = 'Completed only';
  static const String allSaleOrders = 'All';
  static const String saleOrders = 'Sale Orders';
  static const String report = 'Report';
  static const String totalOrdersLabel = 'Total Orders';
  static const String completedLabel = 'Completed';
  static const String partialInProgressLabel = 'Partial in Progress';
  static const String notStartedLabel = 'Not Started';
  static const String progress = 'Progress';
  static const String remainingLabel = 'Remaining';
  // ─── AlertPanel ────────────────────────────────────────
  static const String pendingQCTitle = 'Pending QC';
  static const String itemsReceivedButNotYetTitle = 'Items received but not yet quality-checked.';
  static const String lowStockTitle = 'Low Stock';
  static const String itemsBelowMinimumThresholdTitle = 'Items below minimum threshold.';
  static const String overdueMaintenanceTitle = 'Overdue Maintenance';
  static const String scheduledMaintenanceIsPastDueTitle = 'Scheduled maintenance is past due.';
  static const String pendingAssetRegistrationTitle = 'Pending Asset Registration';
  static const String gRNItemsAwaitingTitle = 'GRN items awaiting asset tag assignment.';
  static const String delayedRepairTitle = 'Delayed Repair';
  static const String twoAssetsOverdueFromRepairTitle = '2 assets overdue from repair center by 2+ days.';
  static const String resolvedSuccessfullySuccessMsg = 'Resolved successfully!';
  static const String alert = 'Alert';
  static const String anomaliesThatCanBlockWork = 'Anomalies that can block work today';
  static const String resolve = 'Resolve';

  // ─── General ───────────────────────────────────────────
  static const String alertsTitle = 'Alerts';
  static const String profileLabel = 'Profile';
  static const String successSuccessMsg = 'Success!';
  static const String submitBtn = 'Submit';

  // ─── Profile ───────────────────────────────────────────
  static const String profileView = 'Profile View';

  // ─── PurchaseOrder ─────────────────────────────────────
  static const String purchaseOrderTitle = 'PurchaseOrder';
  static const String purchaseOrderView = 'PurchaseOrder View';

  // ─── SaleOrder ─────────────────────────────────────────
  static const String saleOrderTitle = 'SaleOrder';
  static const String saleOrderView = 'SaleOrder View';

  // ─── ScanDocument ──────────────────────────────────────
  static const String scanDocumentTitle = 'ScanDocument';
  static const String scanDocumentView = 'ScanDocument View';

  // ─── Accounts ──────────────────────────────────────────
  static const String accountsView = 'Accounts View';

  // ─── Analytics ─────────────────────────────────────────
  static const String analyticsView = 'Analytics View';

  // ─── Inventory ─────────────────────────────────────────
  static const String inventoryView = 'Inventory View';

  // ─── Production ────────────────────────────────────────
  static const String productionView = 'Production View';

  // ─── Security ──────────────────────────────────────────
  static const String securityView = 'Security View';
}
