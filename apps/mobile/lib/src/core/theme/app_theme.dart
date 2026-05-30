import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_bar_theme.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_card_theme.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_colors.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_input_theme.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_navigation_theme.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_sheet_theme.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';

class TnyxTheme {
  // [TAG: LIGHT SCHEMA SPECIFICATION]
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: TnyxColors.lightHighContrastText,
        onPrimary: TnyxColors.lightCanvasBackground,
        secondary: TnyxColors.actionCore,
        onSecondary: TnyxColors.lightCanvasBackground,
        primaryContainer: TnyxColors.lightSurfaceContainer,
        
        surface: TnyxColors.lightCanvasBackground,
        onSurface: TnyxColors.lightHighContrastText,
        surfaceContainer: TnyxColors.lightSurfaceContainer,
        onSurfaceVariant: TnyxColors.lightLowContrastText,
        
        outline: TnyxColors.lightComponentOutline,
        outlineVariant: TnyxColors.lightComponentOutline,
        
        error: TnyxColors.alertCritical,
        onError: TnyxColors.lightOnSystemState,
        errorContainer: TnyxColors.alertWarning,
        onErrorContainer: TnyxColors.lightOnSystemWarning,
        
        tertiary: TnyxColors.alertSuccess,
        onTertiary: TnyxColors.lightOnSystemState,
      ),
      scaffoldBackgroundColor: TnyxColors.lightCanvasBackground,
      appBarTheme: TnyxAppBarTheme.light,
      cardTheme: TnyxCardTheme.light,
      bottomSheetTheme: TnyxSheetTheme.light,
      navigationBarTheme: TnyxNavigationTheme.light,
      inputDecorationTheme: TnyxInputTheme.light,
      textTheme: TnyxTypography.textTheme,
    );
  }

  // [TAG: DARK SCHEMA SPECIFICATION]
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: TnyxColors.darkHighContrastText,
        onPrimary: TnyxColors.darkCanvasBackground,
        secondary: TnyxColors.actionCore,
        onSecondary: TnyxColors.lightCanvasBackground,
        primaryContainer: TnyxColors.darkPrimaryContainer, // Using the Blue color here
        
        surface: TnyxColors.darkCanvasBackground,
        onSurface: TnyxColors.darkHighContrastText,
        surfaceContainer: TnyxColors.darkSurfaceContainer,
        onSurfaceVariant: TnyxColors.darkLowContrastText,
        
        outline: TnyxColors.darkComponentOutline,
        outlineVariant: TnyxColors.darkComponentOutline,
        
        error: TnyxColors.alertCritical,
        onError: TnyxColors.darkOnSystemState,
        errorContainer: TnyxColors.alertWarning,
        onErrorContainer: TnyxColors.darkOnSystemWarning,
        
        tertiary: TnyxColors.alertSuccess,
        onTertiary: TnyxColors.darkOnSystemState,
      ),
      scaffoldBackgroundColor: TnyxColors.darkCanvasBackground,
      appBarTheme: TnyxAppBarTheme.dark,
      cardTheme: TnyxCardTheme.dark,
      bottomSheetTheme: TnyxSheetTheme.dark,
      navigationBarTheme: TnyxNavigationTheme.dark,
      inputDecorationTheme: TnyxInputTheme.dark,
      textTheme: TnyxTypography.textTheme,
    );
  }
}
