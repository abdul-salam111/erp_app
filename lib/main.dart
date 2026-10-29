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

              // Designed and pixel-matched against ~393pt iOS screens
              // (iPhone 14/15 Pro). Many Android phones - Tecno/Infinix
              // HiOS devices included - report a narrower ~360dp logical
              // width, so every fixed-dp value (fonts, icon sizes,
              // padding, gaps) reads proportionally bigger there even
              // though none of it changes per platform in code. Scaling
              // text alone isn't enough: icons and padding stay full-size
              // while only the font shrinks, so spacing still looks off.
              // Scale the whole rendered UI down uniformly instead, via
              // Transform, so text/icons/padding/gaps all shrink together
              // and stay in proportion - exactly as this package-free
              // approach does in the archivist-mobile-app project.
              const referenceWidth = 393.0;
              // Clamped to a max of 1.0, never scaled up: devices at or
              // above the reference width (all target iPhones, tablets,
              // iPads) render at their native, already-correct size.
              final uiScale = (mediaQuery.size.width / referenceWidth).clamp(
                0.75,
                1.0,
              );
              // The OS/accessibility font-size preference is capped at the
              // design's 1.0 baseline - never allowed to inflate text past
              // it - then shrinks further along with everything else via
              // uiScale below. An OEM's larger default "Font size" setting
              // (common on HiOS/EMUI-skinned Android) can only ever shrink
              // text from here, never grow it.
              final cappedTextScaler = mediaQuery.textScaler.clamp(
                maxScaleFactor: 1.0,
              );
              // Inflate the logical canvas by 1/uiScale before the
              // Transform.scale shrinks it back down, so widgets still see
              // "full" screen real-estate to lay out against (no new
              // overflow) while what's actually painted is scaled down to
              // uiScale. Safe-area/keyboard insets are scaled the same way
              // so they still land in the right place post-transform.
              final scaledSize = mediaQuery.size / uiScale;

              return MediaQuery(
                data: mediaQuery.copyWith(
                  size: scaledSize,
                  textScaler: cappedTextScaler,
                  padding: mediaQuery.padding / uiScale,
                  viewPadding: mediaQuery.viewPadding / uiScale,
                  viewInsets: mediaQuery.viewInsets / uiScale,
                ),
                child: Transform.scale(
                  scale: uiScale,
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: scaledSize.width,
                    height: scaledSize.height,
                    child: ApiDebugLayer(
                      child: ForceUpdateGate(
                        child: child ?? const SizedBox.shrink(),
                      ),
                    ),
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
