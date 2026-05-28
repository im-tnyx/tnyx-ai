import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tnyx_mobile/core/navigation/app_router.dart';
import 'package:tnyx_mobile/core/theme/app_theme.dart';

class TnyxApp extends StatelessWidget {
  const TnyxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tnyx',
      debugShowCheckedModeBanner: false,
      theme: TnyxTheme.lightTheme,
      darkTheme: TnyxTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.welcome,
      builder: (context, child) {
        final theme = Theme.of(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: theme.brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
            systemNavigationBarContrastEnforced: false,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: theme.brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
            statusBarBrightness: theme.brightness,
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
