import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/navigation/app_router.dart';
import 'package:tnyx_mobile/core/theme/app_theme.dart';

class TnyxApp extends StatelessWidget {
  const TnyxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TNYX',
      debugShowCheckedModeBanner: false,
      theme: TnyxTheme.lightTheme,
      darkTheme: TnyxTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.welcome,
    );
  }
}
