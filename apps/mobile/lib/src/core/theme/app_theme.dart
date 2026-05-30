import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_colors.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_bar_theme.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_card_theme.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_input_theme.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_navigation_theme.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_sheet_theme.dart';
import 'package:tnyx_mobile/src/core/theme/components/app_button_theme.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';

class TnyxTheme {
  TnyxTheme._();

  static final ColorScheme fallbackLightScheme = ColorScheme.fromSeed(
    seedColor: TnyxColors.brandPrimary,
    brightness: Brightness.light,
  ).copyWith(
    primary: TnyxColors.brandPrimary,
    surface: TnyxColors.lightBackground,
  );

  static final ColorScheme fallbackDarkScheme = ColorScheme.fromSeed(
    seedColor: TnyxColors.brandPrimary,
    brightness: Brightness.dark,
  ).copyWith(
    primary: TnyxColors.brandPrimary,
  );

  static ThemeData buildTheme(ColorScheme colorScheme) {
    final isDark = colorScheme.brightness == Brightness.dark;

    // Harmonizing the scheme with our main brand color
    final finalScheme = colorScheme.copyWith(
      primary: TnyxColors.brandPrimary,
      onPrimary: TnyxColors.brandOnPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: finalScheme,
      scaffoldBackgroundColor: finalScheme.surface,
      cardColor: finalScheme.surfaceContainer,
      
      appBarTheme: isDark ? TnyxAppBarTheme.dark : TnyxAppBarTheme.light,
      cardTheme: isDark ? TnyxCardTheme.dark : TnyxCardTheme.light,
      bottomSheetTheme: isDark ? TnyxSheetTheme.dark : TnyxSheetTheme.light,
      navigationBarTheme: isDark ? TnyxNavigationTheme.dark : TnyxNavigationTheme.light,
      inputDecorationTheme: isDark ? TnyxInputTheme.dark : TnyxInputTheme.light,
      filledButtonTheme: isDark ? TnyxButtonTheme.filledDark : TnyxButtonTheme.filledLight,
      outlinedButtonTheme: isDark ? TnyxButtonTheme.outlinedDark : TnyxButtonTheme.outlinedLight,
      textButtonTheme: isDark ? TnyxButtonTheme.textDark : TnyxButtonTheme.textLight,

      textTheme: TnyxTypography.textTheme.apply(
        bodyColor: finalScheme.onSurface,
        displayColor: finalScheme.onSurface,
      ).copyWith(
        titleLarge: TnyxTypography.textTheme.titleLarge?.copyWith(
          color: finalScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
