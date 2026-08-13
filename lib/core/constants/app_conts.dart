import 'dart:core';

class AppConstants {
  // ─── Roles ─────────────────────────────────────────────
  static const List<String> adminRoles = ['admin', 'mis_cp_admin'];

  // ─── Auth ──────────────────────────────────────────────
  static const String signInTitle = 'Sign In';
  static const String youHaveLoggedinSuccessfully =
      'You have loggedin successfully!';
  static const String emailLabel = 'Email';
  static const String enterYourEmailHint = 'Enter your email';
  static const String passwordLabel = 'Password';
  static const String enterYourPasswordHint = 'Enter your password';
  static const String signInBtn = 'SignIn';
  static const String branchTokenUnavailable = 'Branch token unavailable';
  static const String failedToSelectBranchErrorMsg = 'Failed to select branch';
  static const String noOrganizationsFound = 'No organizations found.';
  static const String selectOrganization = 'Select Organization';
  static const String chooseTheOrganizationYouWant =
      'Choose the organization you want to work with.';
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
  static const String accountLedgerLabel = 'Account Ledger';
  static const String partyLedgerLabel = 'Party Ledger';
  static const String inventoryLabel = 'Inventory';
  static const String purchaseLabel = 'Purchase';
  static const String salesLabel = 'Sales';
  static const String productionLabel = 'Production';
  static const String analyticsLabel = 'Analytics';
  static const String securityLabel = 'Security';
  static const String systemLabel = 'System';
  static const String assetsLabel = 'Assets';
  static const String logout = 'Logout';
  // ─── Employee Dashboard ────────────────────────────────
  static const String employeeDashboardTitle = 'Employee Dashboard';
  static const String myWorkspaceTitle = 'My Workspace';
  static const String noticeBoardTitle = 'Notice Board';
  static const String monthlySnapshotTitle = 'Overview';
  static const String noticesLabel = 'Notices';
  static const String attendanceLabel = 'Attendance';
  static const String leaveRequestLabel = 'Leave Request';
  static const String loanAdvanceLabel = 'Loan / Advance';
  static const String overtimeLabel = 'Overtime';
  static const String salaryLabel = 'Salary';
  static const String acStatementsLabel = 'A/C Statements';
  static const String noticesSubtitle = 'Company announcements';
  static const String attendanceSubtitle = 'Check-in & history';
  static const String leaveRequestSubtitle = 'Apply & track leaves';
  static const String loanAdvanceSubtitle = 'Request loan or advance';
  static const String overtimeSubtitle = 'Extra hours & approvals';
  static const String salarySubtitle = 'Payslips & breakdown';
  static const String acStatementsSubtitle = 'Your account ledger';
  static const String todayAttendanceTitle = 'Today\'s Attendance';
  static const String checkedInLabel = 'Checked in';
  static const String checkOutLabel = 'Check out';
  static const String shiftLabel = 'Shift';
  static const String workedLabel = 'worked';
  static const String onTimeLabel = 'On time';
  static const String leavesThisMonthLabel = 'Leaves this month';
  static const String overtimeMonthLabel = 'Overtime this month';
  static const String attendanceRateLabel = 'Attendance rate';
  static const String loanOutstandingLabel = 'Total loan outstanding';
  static const String lastNetPayLabel = 'Last net pay';
  static const String missingPunchesLabel = 'Missing punches';
  static const String employeeLabel = 'Employee';
  static const String employeePortalTitle = 'Employee Portal';
  static const String checkInLabel = 'Check in';
  static const String totalHoursLabel = 'Total hours';
  static const String presentLabel = 'Present';
  static const String biometricSyncNote = 'Synced from biometric attendance device';

  static const String goodMorning = 'Good Morning';
  static const String goodAfternoon = 'Good Afternoon';
  static const String goodEveningMsg = 'Good Evening';
  static const String eRPDashboard = 'Mantic ERP';
  static const String expensesLabel = 'Expenses';
  static const String newClientsLabel = 'New Clients';
  static const String totalRevenueLabel = 'Total Revenue';
  static const String totalPurchasesLabel = 'Total Purchases';
  static const String recoveriesLabel = 'Recoveries';
  static const String monthOverview = 'Month Overview';
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
  static const String notStartedLabel = 'Pending';
  static const String progress = 'Progress';
  static const String remainingLabel = 'Remaining';
  static const String revenueLabel = 'Revenue';
  static const String purchasesLabel = 'Purchases';
  static const String newPartiesLabel = 'New Parties';
  static const String noDataAvailable = 'No data available';
  static const String noOrdersToday = 'No orders today';
  static const String fromLabel = 'From';
  static const String toLabel = 'To';
  static const String status = 'Status';
  static const String noOrdersInThisPeriod = 'No orders in this period';
  static const String orderDetails = 'Order Details';
  static const String orderLabel = 'Order #';
  static const String totalQtyLabel = 'Total Qty';
  // ─── AlertPanel ────────────────────────────────────────
  static const String pendingQCTitle = 'Pending QC';
  static const String itemsReceivedButNotYetTitle =
      'Items received but not yet quality-checked.';
  static const String lowStockTitle = 'Low Stock';
  static const String itemsBelowMinimumThresholdTitle =
      'Items below minimum threshold.';
  static const String overdueMaintenanceTitle = 'Overdue Maintenance';
  static const String scheduledMaintenanceIsPastDueTitle =
      'Scheduled maintenance is past due.';
  static const String pendingAssetRegistrationTitle =
      'Pending Asset Registration';
  static const String gRNItemsAwaitingTitle =
      'GRN items awaiting asset tag assignment.';
  static const String delayedRepairTitle = 'Delayed Repair';
  static const String twoAssetsOverdueFromRepairTitle =
      '2 assets overdue from repair center by 2+ days.';
  static const String resolvedSuccessfullySuccessMsg = 'Resolved successfully!';
  static const String alert = 'Alert';
  static const String anomaliesThatCanBlockWork =
      'Anomalies that can block work today';
  static const String resolve = 'Resolve';

  // ─── General ───────────────────────────────────────────
  static const String alertsTitle = 'Alerts';
  static const String profileLabel = 'Profile';
  static const String profileSubtitle = 'View your info';
  static const String successSuccessMsg = 'Success!';
  static const String submitBtn = 'Submit';
  static const String todayLabel = 'Today';
  static const String ddMMMYyyyLabel = 'dd MMM yyyy';
  static const String dateLabel = 'Date';
  static const String partyBtn = 'Party';
  static const String productLabel = 'Product';
  // ─── Profile ───────────────────────────────────────────
  static const String profileView = 'Profile View';
  static const String personalInformationTitle = 'Personal Information';
  static const String fullNameLabel = 'Full Name';
  static const String userIDLabel = 'User ID';
  static const String roleLabel = 'Role';
  static const String organizationTitle = 'Organization';
  static const String nameLabel = 'Name';
  static const String tenantLabel = 'Tenant';
  static const String countryLabel = 'Country';
  static const String switchOrganization = 'Switch Organization';
  static const String changeToADifferentOrganization =
      'Change to a different organization';
  static const String logOut = 'Log Out';
  static const String signOutOfYourAccount = 'Sign out of your account';
  // ─── PurchaseOrder ─────────────────────────────────────
  static const String purchaseOrderTitle = 'Purchase Order';
  static const String purchaseOrderView = 'PurchaseOrder View';
  static const String netAmountLabel = 'Net Amount';
  static const String searchByDocRefNo = 'Search by Doc / Ref No';
  static const String selectDateRangeAndTap =
      'Select a date range and tap View';
  static const String partyLabel = 'Party';
  static const String docNoLabel = 'Doc No';
  static const String refNoLabel = 'Ref #';
  static const String rowsLabel = 'Rows';
  static const String remarksLabel = 'Remarks';
  static const String supplierLabel = 'Supplier';
  static const String brokerLabel = 'Broker';
  static const String orderSourceLabel = 'Order Source';
  static const String paymentModeLabel = 'Payment Mode';
  static const String weightSourceLabel = 'Weight Source';
  static const String calculationsLabel = 'Select Calculation';
  static const String currencyLabel = 'Currency';
  static const String currencyRateLabel = 'Currency Rate';
  static const String currencyRate = 'Rate';
    

  // ─── SaleOrder ─────────────────────────────────────────
  static const String saleOrderTitle = 'SaleOrder';
  static const String saleOrderView = 'SaleOrder View';

  // ─── ScanDocument ──────────────────────────────────────
  static const String scanDocumentTitle = 'ScanDocument';
  static const String scanDocumentView = 'ScanDocument View';

  // ─── Accounts ──────────────────────────────────────────
  static const String accountsView = 'Accounts View';
  static const String totalReceivedTodayLabel = 'Total Received Today';
  static const String totalPostponeLabel = 'Total Postpone';
  static const String totalDueTodayLabel = 'Total Due Today';
  static const String recoveryDueTodayTitle = 'Recovery Due';
  static const String hideDetails = 'Hide List';
  static const String showDetails = 'Show List';
  static const String accountStatementsLabel = 'Account Ledger';
  static const String partyStatementsLabel = 'Party Ledger';
  static const String bankCashPositionLabel = 'Bank & Cash Position';
  static const String cashbookLabel = 'Cashbook';
  static const String creditManagementLabel = 'Credit Mgmt';
  static const String creditManagmentTitle = 'Credit Management';
  static const String customerReceivableLabel = 'Customer Receivable';
  static const String vendorPayableLabel = 'Vendor Payable';
  static const String recoveryProgress = 'Recovery progress';
  static const String weekLabel = 'Week';
  static const String monthLabel = 'Month';
  static const String oldestLabel = 'Oldest';
  static const String hideDetailsLabel = 'Hide Details';
  static const String addReceipt = 'Add Receipt';
  static const String postponeInvoice = 'Postpone Invoice';
  static const String actionReq = 'Action req.';
  static const String partial = 'Partial';
  static const String pleaseSelectAnAccountFirstErrorMsg =
      'Please select an account first';
  static const String invoiceReadySuccessMsg = 'Invoice ready';
  static const String somethingWentWrong = 'Something went wrong';
  static const String selectAccount = 'Select account…';
  static const String accountBtn = 'Account';
  static const String selectAccountHint = 'Select Account';
  static const String fromDateBtn = 'From Date';
  static const String toDateBtn = 'To Date';
  static const String view = 'Apply';
  static const String statementsBtn = 'Statements';
  static const String noLedgerDataAvailable = 'No ledger data available';
  static const String openingBalance = 'Opening balance';
  static const String debit = 'Debit';
  static const String credit = 'Credit';
  static const String drCr = 'Dr / Cr';
  static const String openingBalance2 = 'Opening Balance';
  static const String debitTransaction = 'Debit Transaction';
  static const String creditTransaction = 'Credit Transaction';
  static const String drCrTransaction = 'Dr / Cr Transaction';
  static const String docLabel = 'Doc #';
  static const String narrationLabel = 'Narration';
  static const String balanceAfterLabel = 'Balance after';
  static const String close = 'Close';
  static const String printInvoiceLabel = 'Print Invoice';
  static const String noStatementsYet = 'No statements yet';
  static const String selectAnAccountAndTap = 'Select an account and tap View';
  static const String noRecordsFound = 'No records found';
  static const String trySelectingADifferentDate =
      'Try selecting a different date range';
  static const String retry = 'Retry';
  static const String dr = 'Dr';
  static const String cr = 'Cr';
  static const String bankLabel = 'Bank';
  static const String cashLabel = 'Cash';

  static const String pleaseSelectAPartyFirstErrorMsg =
      'Please select a party first';
  static const String selectParty = 'Select party…';
  static const String selectPartyHint = 'Select Party';
  static const String selectAPartyAndTap = 'Select a party and tap View';
  static const String customerBtn = 'Customer';
  static const String selectCustomer = 'Select customer…';
  static const String selectCustomerHint = 'Select Customer';
  static const String selectACustomerAndTap = 'Select a customer and tap View';
  static const String pleaseSelectACustomerFirstErrorMsg =
      'Please select a customer first';
  static const String openingLabel = 'Opening';
  static const String balanceLabel = 'Balance';
  static const String locationLabel = 'Location';
  // ─── Analytics ─────────────────────────────────────────
  static const String analyticsView = 'Analytics View';

  // ─── Inventory ─────────────────────────────────────────
  static const String inventoryView = 'Inventory View';
  static const String nA = 'N/A';
  static const String noStockDataAvailable = 'No stock data available';
  static const String currentStock = 'Current Stock';
  static const String liveInventoryByProduct = 'Live inventory by product';
  static const String qtyWeight = 'Qty / Weight';
  static const String total = 'Total';
  static const String thisWeek = 'This Week';
  static const String thisMonth = 'This Month';
  static const String stockReceived = 'Stock Received';
  static const String incomingStockByPartyItem =
      'Incoming stock by party / item';
  static const String noStockReceived = 'No stock received';
  // ─── Production ────────────────────────────────────────
  static const String productionView = 'Production View';

  // ─── Security ──────────────────────────────────────────
  static const String securityView = 'Security View';
}
