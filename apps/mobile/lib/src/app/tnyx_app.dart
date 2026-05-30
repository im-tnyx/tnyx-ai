import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:tnyx_mobile/src/core/navigation/app_router.dart';
import 'package:tnyx_mobile/src/core/theme/app_theme.dart';
import 'package:tnyx_mobile/src/core/theme/manager/theme_mode_scope.dart';

class TnyxApp extends StatelessWidget {
  const TnyxApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeScope.watch(context).themeMode;

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final lightScheme = lightDynamic ?? TnyxTheme.fallbackLightScheme;
        final darkScheme = darkDynamic ?? TnyxTheme.fallbackDarkScheme;

        return MaterialApp(
          title: 'Tnyx',
          debugShowCheckedModeBanner: false,
          theme: TnyxTheme.buildTheme(lightScheme),
          darkTheme: TnyxTheme.buildTheme(darkScheme),
          themeMode: themeMode,
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
      },
    );
  }
}
