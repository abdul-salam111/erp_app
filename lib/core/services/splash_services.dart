import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/route_exports.dart';
import 'session_manager.dart';

class SplashServices {
  void isLoggedIn(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (!context.mounted) return;
      checkLoginStatus(context);
    });
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    try {
      await SessionController().getUserFromStorage();

      if (!context.mounted) return;

      if (SessionController().islogin == true) {
        final user = SessionController().loggedInUser;
        final isAdmin = user?.isAdmin ?? false;

        if (isAdmin) {
          if (SessionController().selectedOrganization == null) {
            final orgs = user?.organizations ?? [];
            if (orgs.length == 1) {
              await SessionController().saveSelectedOrganization(orgs.first);
              if (!context.mounted) return;
              context.goNamed(RouteNames.dashboard);
            } else {
              context.goNamed(RouteNames.organizationSelection);
            }
          } else {
            context.goNamed(RouteNames.dashboard);
          }
        } else {
          final roles = user?.roles ?? [];
          if (roles.length > 1) {
            context.goNamed(RouteNames.choose_dashboard);
          } else {
            context.goNamed(RouteNames.employee_dashboard);
          }
        }
      } else {
        context.goNamed(RouteNames.signin);
      }
    } catch (e) {
      debugPrint('Error in checkLoginStatus: $e');
    }
  }
}
