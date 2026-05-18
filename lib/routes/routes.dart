import 'package:go_router/go_router.dart';

// import '../core/services/session_manager.dart';
import '../features/auth/auth_exports.dart';
import '../features/dashboard/dashboard_exports.dart';
import '../features/splash/splash_view.dart';
import 'route_exports.dart';
import '../features/profile/profile_exports.dart';
import '../features/alert_panel/alert_panel_exports.dart';


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
     
    ],
  );
}
