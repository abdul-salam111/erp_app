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
              final mediaQuery = MediaQuery.of(context);

              // Many Android phones (including Tecno/Infinix HiOS devices)
              // report a logical width around the 360dp Android baseline,
              // noticeably narrower than the ~393-430pt iOS devices these
              // screens were designed against - so fixed font sizes read
              // visibly larger/tighter there even with no accessibility
              // text-size change at all. Scale text down to match screen
              // width, on top of (not instead of) clamping whatever system
              // font-size preference the OS itself reports. Same approach
              // as the archivist-mobile-app project.
              const referenceWidth = 393.0;
              final widthRatio = (mediaQuery.size.width / referenceWidth).clamp(
                0.0,
                1.0,
              );
              // Squared, not linear: a straight width ratio (e.g. 360/393
              // = 0.92) undershoots how much smaller text actually needs
              // to be, because fixed-dp paddings/icons/pills don't shrink
              // at all - only the font does. Squaring the ratio leans
              // harder on the font to compensate for that (0.92 -> 0.84),
              // without having to touch every hardcoded size in the app.
              final widthFactor = (widthRatio * widthRatio).clamp(0.75, 1.0);
              // Capped at 1.0, not just clamped down from some higher
              // ceiling: these screens are pixel-matched against Figma, so
              // an OEM's larger default "Font size" accessibility setting
              // (common on HiOS/EMUI-skinned Android) must never be
              // allowed to inflate text past that fixed design - it can
              // only ever shrink it, same as the width factor above.
              final systemScale = mediaQuery.textScaler
                  .clamp(minScaleFactor: 0.9, maxScaleFactor: 1.0)
                  .scale(1.0);
              final responsiveScaler = TextScaler.linear(
                (systemScale * widthFactor).clamp(0.75, 1.0),
              );

              return MediaQuery(
                data: mediaQuery.copyWith(textScaler: responsiveScaler),
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
