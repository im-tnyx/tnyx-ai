import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode {
  system,
  light,
  dark,
}

extension AppThemeModeX on AppThemeMode {
  ThemeMode toThemeMode() {
    switch (this) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }

  String get storageValue => name;

  static AppThemeMode fromStorageValue(String? value) {
    return AppThemeMode.values.firstWhere(
      (mode) => mode.storageValue == value,
      orElse: () => AppThemeMode.system,
    );
  }
}

class ThemeModeManager extends ChangeNotifier {
  ThemeModeManager();

  static const String _themeModeKey = 'tnyx_theme_mode';

  AppThemeMode _currentMode = AppThemeMode.system;

  AppThemeMode get currentMode => _currentMode;
  ThemeMode get themeMode => _currentMode.toThemeMode();

  Future<void> load() async {
    final preferences = await SharedPreferences.getInstance();
    _currentMode =
        AppThemeModeX.fromStorageValue(preferences.getString(_themeModeKey));
    notifyListeners();
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (_currentMode == mode) return;
    _currentMode = mode;
    notifyListeners();

    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_themeModeKey, mode.storageValue);
  }
}
