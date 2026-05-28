import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_bar_theme.dart';
import 'package:tnyx_mobile/core/theme/app_card_theme.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_input_theme.dart';
import 'package:tnyx_mobile/core/theme/app_navigation_theme.dart';
import 'package:tnyx_mobile/core/theme/app_sheet_theme.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';

sealed class TnyxTheme {
  TnyxTheme._();

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.light(
      primary: TnyxColors.brandPrimary,
      onPrimary: TnyxColors.brandOnPrimary,

      primaryContainer: TnyxColors.brandPrimaryContainer,
      onPrimaryContainer: TnyxColors.brandOnPrimaryContainer,

      surface: TnyxColors.lightSurface,
      onSurface: TnyxColors.lightOnSurface,

      surfaceContainerHighest: TnyxColors.lightSurfaceVariant,

      outline: TnyxColors.lightOutline,

      error: TnyxColors.error,
      onError: TnyxColors.white,

      errorContainer: TnyxColors.errorContainerLight,
      onErrorContainer: TnyxColors.onErrorContainerLight,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      colorScheme: colorScheme,

      scaffoldBackgroundColor: TnyxColors.lightBackground,

      textTheme: TnyxTypography.textTheme,

      dividerColor: TnyxColors.lightDivider,

      disabledColor: TnyxColors.lightDisabled,

      splashFactory: InkRipple.splashFactory,

      appBarTheme: TnyxAppBarTheme.light,

      cardTheme: TnyxCardTheme.light,

      bottomSheetTheme: TnyxSheetTheme.light,

      navigationBarTheme: TnyxNavigationTheme.light,

      inputDecorationTheme: TnyxInputTheme.light,
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.dark(
      primary: TnyxColors.brandPrimary,
      onPrimary: TnyxColors.brandOnPrimary,

      primaryContainer: TnyxColors.brandOnPrimaryContainer,
      onPrimaryContainer: TnyxColors.brandPrimaryContainer,

      surface: TnyxColors.darkSurface,
      onSurface: TnyxColors.darkOnSurface,

      surfaceContainerHighest: TnyxColors.darkSurfaceVariant,

      outline: TnyxColors.darkOutline,

      error: TnyxColors.error,
      onError: TnyxColors.white,

      errorContainer: TnyxColors.errorContainerDark,
      onErrorContainer: TnyxColors.onErrorContainerDark,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      colorScheme: colorScheme,

      scaffoldBackgroundColor: TnyxColors.darkBackground,

      textTheme: TnyxTypography.textTheme,

      dividerColor: TnyxColors.darkDivider,

      disabledColor: TnyxColors.darkDisabled,

      splashFactory: InkRipple.splashFactory,

      appBarTheme: TnyxAppBarTheme.dark,

      cardTheme: TnyxCardTheme.dark,

      bottomSheetTheme: TnyxSheetTheme.dark,

      navigationBarTheme: TnyxNavigationTheme.dark,

      inputDecorationTheme: TnyxInputTheme.dark,
    );
  }
}