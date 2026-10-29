import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'core/app_updates/force_update_gate.dart';
import 'core/app_updates/force_update_service.dart';
import 'core/config/app_config.dart';
import 'core/debug/api_debug_overlay.dart';
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
    LiquidGlassWidgets.initialize(),
  ]);

  runApp(
    LiquidGlassWidgets.wrap(
      brightnessResolver: Theme.maybeBrightnessOf,
      child: const MyApp(),
    ),
  );
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
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.router,
            builder: (context, child) {
              // Some Android OEMs (e.g. Tecno's HiOS) ship with a larger
              // default system font-size setting than iOS, so the same
              // logical fontSize renders visibly bigger there. Clamp the
              // device text scale so layouts look the same across devices
              // instead of inheriting whatever the OS/user has set.
              final clampedScaler = MediaQuery.textScalerOf(
                context,
              ).clamp(minScaleFactor: 0.9, maxScaleFactor: 1.1);
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: clampedScaler),
                child: ApiDebugLayer(
                  child: ForceUpdateGate(
                    child: child ?? const SizedBox.shrink(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
