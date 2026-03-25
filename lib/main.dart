import 'package:flutter/material.dart';
import 'app_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(LoadTheme()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Project',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}
