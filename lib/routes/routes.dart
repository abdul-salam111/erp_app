import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/auth_exports.dart';
import '../features/dashboard/dashboard_exports.dart';
import '../features/splash/splash_view.dart';
import 'route_exports.dart';
import '../features/profile/profile_exports.dart';
import '../features/alert_panel/alert_panel_exports.dart';
import '../features/purchase_order/purchase_order_exports.dart';
import '../features/sale_order/sale_order_exports.dart';
import '../features/scan_document/scan_document_exports.dart';
import '../features/accounts/accounts_exports.dart';
import '../features/accounts/presentation/credit_management/views/credit_management_details_view.dart';
import '../features/inventory/inventory_exports.dart';
import '../features/production/production_exports.dart';
import '../features/analytics/analytics_exports.dart';
import '../features/system/system_exports.dart';
import '../features/attendance/attendance_exports.dart';
import '../features/leaves/leaves_exports.dart';
import '../features/salary_mgmt/salary_mgmt_exports.dart';
import '../features/salary_mgmt/presentation/salary_detail/views/salary_detail_view.dart';


class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    redirect: (context, state) {
      final isLoggedIn = SessionController.instance.islogin;
      final location = state.matchedLocation;

      // Splash handles its own navigation — never redirect it.
      if (location == RoutePaths.splash) return null;

      if (!isLoggedIn && location != RoutePaths.signin) {
        return RoutePaths.signin;
      }

      if (isLoggedIn && location == RoutePaths.signin) {
        return RoutePaths.dashboard;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.signin,
        name: RouteNames.signin,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignInView(),
          transitionDuration: const Duration(milliseconds: 650),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Signin rises from below and fades in
            final slide = Tween<Offset>(
              begin: const Offset(0, 0.07),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

            final scale = Tween<double>(begin: 0.96, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

            // Signin dims + shrinks when something pushes on top of it
            final secondaryScale = Tween<double>(begin: 1.0, end: 0.95).animate(
              CurvedAnimation(parent: secondaryAnimation, curve: Curves.easeIn),
            );
            final secondaryOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
              CurvedAnimation(parent: secondaryAnimation, curve: Curves.easeIn),
            );

            return FadeTransition(
              opacity: secondaryOpacity,
              child: ScaleTransition(
                scale: secondaryScale,
                child: FadeTransition(
                  opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
                  child: SlideTransition(
                    position: slide,
                    child: ScaleTransition(scale: scale, child: child),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      GoRoute(
        path: RoutePaths.splash,
        name: RouteNames.splash,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SplashView(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Splash fades in on load; zooms out + fades when signin rises over it
            final exitScale = Tween<double>(begin: 1.0, end: 1.08).animate(
              CurvedAnimation(parent: secondaryAnimation, curve: Curves.easeIn),
            );
            final exitOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
              CurvedAnimation(parent: secondaryAnimation, curve: Curves.easeIn),
            );

            return FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
              child: FadeTransition(
                opacity: exitOpacity,
                child: ScaleTransition(scale: exitScale, child: child),
              ),
            );
          },
        ),
      ),
      GoRoute(
        path: RoutePaths.dashboard,
        name: RouteNames.dashboard,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const DashboardView(),
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final scale = Tween<double>(begin: 0.94, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );
            return FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
              child: ScaleTransition(scale: scale, child: child),
            );
          },
        ),
      ),
      GoRoute(
        path: RoutePaths.employee_dashboard,
        name: RouteNames.employee_dashboard,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const EmployeeDashboard(),
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final scale = Tween<double>(begin: 0.94, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );
            return FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
              child: ScaleTransition(scale: scale, child: child),
            );
          },
        ),
      ),
      GoRoute(
        path: RoutePaths.profile,
        name: RouteNames.profile,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: RoutePaths.alert_panel,
        name: RouteNames.alert_panel,
        builder: (context, state) => const AlertPanelView(),
      ),
      GoRoute(
        path: RoutePaths.purchase_order,
        name: RouteNames.purchase_order,
        builder: (context, state) => const PurchaseOrderView(),
      ),
      GoRoute(
        path: RoutePaths.sale_order,
        name: RouteNames.sale_order,
        builder: (context, state) => const SaleOrderView(),
      ),
      GoRoute(
        path: RoutePaths.scan_document,
        name: RouteNames.scan_document,
        builder: (context, state) => const ScanDocumentView(),
      ),
      GoRoute(
        path: RoutePaths.accounts,
        name: RouteNames.accounts,
        builder: (context, state) => const AccountsView(),
      ),
      GoRoute(
        path: RoutePaths.inventory,
        name: RouteNames.inventory,
        builder: (context, state) => const InventoryView(),
      ),
      GoRoute(
        path: RoutePaths.production,
        name: RouteNames.production,
        builder: (context, state) => const ProductionView(),
      ),
      GoRoute(
        path: RoutePaths.analytics,
        name: RouteNames.analytics,
        builder: (context, state) => const AnalyticsView(),
      ),
      GoRoute(
        path: RoutePaths.security,
        name: RouteNames.security,
        builder: (context, state) => const SecurityView(),
      ),
      GoRoute(
        path: RoutePaths.account_ledger,
        name: RouteNames.account_ledger,
        builder: (context, state) => const AccountLedgerView(),
      ),
      GoRoute(
        path: RoutePaths.organizationSelection,
        name: RouteNames.organizationSelection,
        builder: (context, state) => const OrganizationSelectionView(),
      ),
      GoRoute(
        path: RoutePaths.party_ledger,
        name: RouteNames.party_ledger,
        builder: (context, state) => const PartyLedgerView(),
      ),
      GoRoute(
        path: RoutePaths.bank_and_cash_position,
        name: RouteNames.bank_and_cash_position,
        builder: (context, state) => const BankAndCashPositionView(),
      ),
      GoRoute(
        path: RoutePaths.cashbook,
        name: RouteNames.cashbook,
        builder: (context, state) => const CashbookView(),
      ),
      GoRoute(
        path: RoutePaths.credit_management,
        name: RouteNames.credit_management,
        builder: (context, state) => const CreditManagementView(),
      ),
      GoRoute(
        path: RoutePaths.credit_management_details,
        name: RouteNames.credit_management_details,
        builder: (context, state) {
          final args = state.extra as CreditManagementDetailsArgs;
          return CreditManagementDetailsView(
            customer: args.customer,
            city: args.city,
            creditRating: args.creditRating,
            ratingColor: args.ratingColor,
            balance: args.balance,
            partyId: args.partyId,
            firstSegmentAmount: args.firstSegmentAmount,
            secondSegmentAmount: args.secondSegmentAmount,
            thirdSegmentAmount: args.thirdSegmentAmount,
            fourthSegmentAmount: args.fourthSegmentAmount,
          );
        },
      ),
      GoRoute(
        path: RoutePaths.customer_recievables,
        name: RouteNames.customer_recievables,
        builder: (context, state) => const CustomerRecievablesView(),
      ),
      GoRoute(
        path: RoutePaths.vendor_payable,
        name: RouteNames.vendor_payable,
        builder: (context, state) => const VendorPayableView(),
      ),
      GoRoute(
        path: RoutePaths.create_purchase_order,
        name: RouteNames.create_purchase_order,
        builder: (context, state) =>
            CreatePurchaseOrderView(orderId: state.extra as int?),
      ),
      GoRoute(
        path: RoutePaths.create_sale_order,
        name: RouteNames.create_sale_order,
        builder: (context, state) =>
            CreateSaleOrderView(orderId: state.extra as int?),
      ),
      GoRoute(
        path: RoutePaths.system,
        name: RouteNames.system,
        builder: (context, state) => const SystemView(),
      ),
      GoRoute(
        path: RoutePaths.system_setup,
        name: RouteNames.system_setup,
        builder: (context, state) => const SetupView(),
      ),
      GoRoute(
        path: RoutePaths.attendance,
        name: RouteNames.attendance,
        builder: (context, state) => const AttendanceView(),
      ),
      GoRoute(
        path: RoutePaths.leaves,
        name: RouteNames.leaves,
        builder: (context, state) => const LeavesView(),
      ),
      GoRoute(
        path: RoutePaths.apply_leave,
        name: RouteNames.apply_leave,
        builder: (context, state) => const ApplyLeaveView(),
      ),
      GoRoute(
        path: RoutePaths.leave_detail,
        name: RouteNames.leave_detail,
        builder: (context, state) =>
            LeaveDetailView(args: state.extra as LeaveDetailArgs),
      ),
      GoRoute(
        path: RoutePaths.salary_mgmt,
        name: RouteNames.salary_mgmt,
        builder: (context, state) => const SalaryMgmtView(),
      ),
      GoRoute(
        path: RoutePaths.salary_detail,
        name: RouteNames.salary_detail,
        builder: (context, state) =>
            SalaryDetailView(record: state.extra as SalaryRecord),
      ),
    
     
     
    ],
  );
}
