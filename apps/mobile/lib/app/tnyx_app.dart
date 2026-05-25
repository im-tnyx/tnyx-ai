import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/language/language_manager.dart';
import 'package:tnyx_mobile/core/language/language_scope.dart';
import 'package:tnyx_mobile/core/navigation/app_router.dart';
import 'package:tnyx_mobile/core/theme/app_theme.dart';
import 'package:tnyx_mobile/core/theme/theme_mode_manager.dart';
import 'package:tnyx_mobile/core/theme/theme_mode_scope.dart';

class TnyxApp extends StatefulWidget {
  const TnyxApp({super.key});

  @override
  State<TnyxApp> createState() => _TnyxAppState();
}

class _TnyxAppState extends State<TnyxApp> {
  late final LanguageManager _languageManager;
  late final ThemeModeManager _themeModeManager;

  @override
  void initState() {
    super.initState();
    _languageManager = LanguageManager();
    _languageManager.load();
    _themeModeManager = ThemeModeManager();
    _themeModeManager.load();
  }

  @override
  void dispose() {
    _languageManager.dispose();
    _themeModeManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeModeScope(
      notifier: _themeModeManager,
      child: LanguageScope(
        notifier: _languageManager,
        child: AnimatedBuilder(
          animation: _themeModeManager,
          builder: (_, __) => MaterialApp(
            title: 'TNYX',
            debugShowCheckedModeBanner: false,
            theme: TnyxTheme.lightTheme,
            darkTheme: TnyxTheme.darkTheme,
            themeMode: _themeModeManager.themeMode,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRoutes.welcome,
          ),
        ),
      ),
    );
  }
}
