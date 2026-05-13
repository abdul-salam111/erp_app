import 'package:flutter/material.dart';

import '../../app_exports.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final SplashServices splashServices;
  @override
  void initState() {
    super.initState();
    splashServices = SplashServices();
    splashServices.isLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AppLogo()));
  }
}
