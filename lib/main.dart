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
              final content = ApiDebugLayer(
                child: ForceUpdateGate(child: child ?? const SizedBox.shrink()),
              );

              // Designed and pixel-matched against ~393pt iOS screens
              // (iPhone 14/15 Pro). Many Android phones - Tecno/Infinix
              // HiOS devices included - report a narrower ~360dp logical
              // width, so every fixed-dp value (fonts, icon sizes,
              // padding, gaps) reads proportionally bigger there even
              // though none of it changes per platform in code.
              const referenceWidth = 393.0;
              // Clamped to a max of 1.0, never scaled up: devices at or
              // above the reference width (all target iPhones, tablets,
              // iPads) render at their native, already-correct size - skip
              // the scaling wrapper for them entirely.
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

              if (uiScale >= 1.0) {
                return MediaQuery(
                  data: mediaQuery.copyWith(textScaler: cappedTextScaler),
                  child: content,
                );
              }

              // The root View always forces the app to exactly the real
              // screen size (tight constraints), so a plain Transform.scale
              // can't be used here: its child would just get squeezed back
              // down to the real (already small) size before the transform
              // ever saw it, scaling an already-correct layout down even
              // further. FittedBox is built for exactly this: it lays its
              // child out UNconstrained at its natural/requested size (the
              // full-size "design canvas" below), then paints/hit-tests
              // that through a matrix that fits it into the real screen -
              // so text/icons/padding/gaps all shrink together in
              // proportion, instead of only text scaling down.
              final designSize = mediaQuery.size / uiScale;

              return MediaQuery(
                data: mediaQuery.copyWith(
                  size: designSize,
                  textScaler: cappedTextScaler,
                  padding: mediaQuery.padding / uiScale,
                  viewPadding: mediaQuery.viewPadding / uiScale,
                  viewInsets: mediaQuery.viewInsets / uiScale,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: designSize.width,
                    height: designSize.height,
                    child: content,
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
