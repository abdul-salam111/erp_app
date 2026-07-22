import 'package:get_it/get_it.dart';
import 'register_network.dart';
import 'register_core.dart';
import 'register_auth.dart';
import 'register_profile.dart';
import 'register_alert_panel.dart';
import 'register_purchase_order.dart';
import 'register_sale_order.dart';
import 'register_scan_document.dart';
import 'register_accounts.dart';
import 'register_inventory.dart';
import 'register_production.dart';
import 'register_analytics.dart';
import 'register_security.dart';
import 'register_dashboard.dart';
import 'register_system.dart';
import 'register_attendance.dart';
import 'register_leaves.dart';
import 'register_salary_mgmt.dart';
import 'register_loan_and_advance.dart';


/// Global service locator instance.
/// Import this file wherever [sl] or [setupLocator] is needed.
final sl = GetIt.instance;

Future<void> setupLocator() async {
  await registerNetwork();
  await registerCore();
  await registerAuth();

  await profileDependencies();
  await registerAlertPanel();
  await registerPurchaseOrder();
  await registerSaleOrder();
  await registerScanDocument();
  await registerAccounts();
  await registerInventory();
  await registerProduction();
  await registerAnalytics();
  await registerSecurity();
  await registerDashboard();
  await registerSystem();
  await registerAttendance();
  await registerLeaves();
  await registerSalaryMgmt();
  await registerLoanAndAdvance();
}
