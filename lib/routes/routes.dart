import '../app_exports.dart';

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
    ],
  );
}
