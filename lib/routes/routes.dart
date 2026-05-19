import 'package:go_router/go_router.dart';

// import '../core/services/session_manager.dart';
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
import '../features/inventory/inventory_exports.dart';
import '../features/production/production_exports.dart';
import '../features/analytics/analytics_exports.dart';
import '../features/security/security_exports.dart';


class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    redirect: (context, state) {
      // final isLoggedIn = SessionController.instance.islogin;
      // final location = state.matchedLocation;

      // // Splash handles its own navigation — never redirect it.
      // if (location == RoutePaths.splash) return null;

      // if (!isLoggedIn && location != RoutePaths.signin) {
      //   return RoutePaths.dashboard;
      // }

      // if (isLoggedIn && location == RoutePaths.signin) {
      //   return RoutePaths.dashboard;
      // }

      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.signin,
        name: RouteNames.signin,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: RoutePaths.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RoutePaths.dashboard,
        name: RouteNames.dashboard,
        builder: (context, state) => const DashboardView(),
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
     
    ],
  );
}
