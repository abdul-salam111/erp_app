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
      await SessionController().getUserfromSharedpref();

      if (!context.mounted) return;

      if (SessionController().islogin == true) {
        context.pushNamed(RouteNames.signin);
      } else {
        context.pushNamed(RouteNames.dashboard);
      }
    } catch (e) {
      debugPrint('Error in checkLoginStatus: $e');
    }
  }
}
