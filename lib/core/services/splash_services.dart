import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/route_exports.dart';
import 'session_manager.dart';

class SplashServices {
  void isLoggedIn(BuildContext context) {
    _isLoggedInAsync(context);
  }

  Future<void> _isLoggedInAsync(BuildContext context) async {
    await Future.wait([
      checkLoginStatus(context),
      Future.delayed(const Duration(seconds: 3)),
    ]);
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    try {
      // Wired here (not main.dart) since splash owns session bootstrap —
      // uses the router directly, not this context, because the silent
      // token-refresh interceptor can fire this long after splash is gone.
      SessionController.instance.onOrganizationUnavailable =
          () => AppRoutes.router.goNamed(RouteNames.organizationSelection);

      await SessionController().getUserFromStorage();

      if (!context.mounted) return;

      if (SessionController().islogin == true) {
        final session = SessionController();
        final isAdmin = session.isAdmin;

        if (isAdmin) {
          if (session.selectedOrganization == null) {
            final orgs = session.loggedInUser?.organizations ?? [];
            if (orgs.length == 1) {
              await session.saveSelectedOrganization(orgs.first);
              if (!context.mounted) return;
              context.goNamed(RouteNames.dashboard);
            } else {
              context.goNamed(RouteNames.organizationSelection);
            }
          } else {
            context.goNamed(RouteNames.dashboard);
          }
        } else {
          context.goNamed(RouteNames.choose_dashboard);
        }
      } else {
        context.goNamed(RouteNames.signin);
      }
    } catch (e) {
      debugPrint('Error in checkLoginStatus: $e');
    }
  }
}
