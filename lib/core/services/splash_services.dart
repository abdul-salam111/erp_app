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

        if (session.selectedOrganization == null) {
          final orgs = session.loggedInUser?.organizations ?? [];
          if (orgs.length == 1) {
            await session.saveSelectedOrganization(orgs.first);
            if (!context.mounted) return;
          } else {
            context.goNamed(RouteNames.organizationSelection);
            return;
          }
        }

        // Reopen the workspace the user last picked. The role is re-checked
        // against the current grants, so a revoked role falls back to the
        // picker instead of opening a dashboard the user no longer has.
        final savedRoute = session.selectedRoleRoute;
        final savedRole = session.selectedRole;
        final stillGranted =
            savedRoute == RouteNames.employee_dashboard ||
            (savedRole != null && session.userRoles.contains(savedRole));

        if (savedRoute != null && stillGranted) {
          context.goNamed(savedRoute);
        } else {
          // The Employee Portal card is listed alongside the assigned roles,
          // so there is always more than one workspace to pick from.
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
