import 'package:flutter/material.dart';

import '../../core/di/app_dependencies.dart';
import '../../core/services/services_exports.dart';
import '../../core/widgets/widgets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    sl<SplashServices>().isLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AppLogo()));
  }
}
