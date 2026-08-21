import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_updates/force_update_gate.dart';
import 'core/app_updates/force_update_service.dart';
import 'core/config/app_config.dart';
import 'core/debug/api_debug_overlay.dart';
import 'core/debug/dev_flags.dart';
import 'core/di/app_dependencies.dart';
import 'core/theme/theme_exports.dart';
import 'core/utils/utils_exports.dart';
import 'firebase_options.dart';
import 'routes/route_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  await Future.wait([
    AppConfig.instance.initialize(),
    ForceUpdateService().initialize(),
    setupLocator(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeBloc>()..add(LoadTheme()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Mantic ERP',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.router,
            builder: (context, child) {
              final gate = ForceUpdateGate(child: child ?? const SizedBox.shrink());
              return kDevTools ? ApiDebugLayer(child: gate) : gate;
            },
          );
        },
      ),
    );
  }
}
