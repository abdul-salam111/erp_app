import 'package:go_router/go_router.dart';

import '../features/auth/auth_exports.dart';
import '../features/dashboard/dashboard_exports.dart';
import '../features/splash/splash_view.dart';
import 'route_exports.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
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
    ],
  );
}
