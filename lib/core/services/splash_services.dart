import 'dart:async';

import 'package:flutter/material.dart';

import '../../app_exports.dart';

class SplashServices {
  void isLoggedIn(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      checkLoginStatus(context);
    });
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    try {
      await SessionController().getUserfromSharedpref();

      if (SessionController().islogin == true) {
        context.pushNamed(RouteNames.signin);
      } else {
        context.pushNamed(RouteNames.signin);
      }
    } catch (e) {
      debugPrint('Error in checkLoginStatus: $e');
    }
  }
}
