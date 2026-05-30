import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tnyx_mobile/src/app/tnyx_app.dart';
import 'package:tnyx_mobile/src/core/language/language_manager.dart';
import 'package:tnyx_mobile/src/core/language/language_scope.dart';
import 'package:tnyx_mobile/src/core/theme/manager/theme_mode_manager.dart';
import 'package:tnyx_mobile/src/core/theme/manager/theme_mode_scope.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Managers
  final languageManager = LanguageManager();
  final themeModeManager = ThemeModeManager();

  // Load saved preferences
  await Future.wait([
    languageManager.load(),
    themeModeManager.load(),
  ]);

  // Edge-to-edge display enable karein
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Global system UI style set karein
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  ));

  runApp(
    ThemeModeScope(
      notifier: themeModeManager,
      child: LanguageScope(
        notifier: languageManager,
        child: const TnyxApp(),
      ),
    ),
  );
}
