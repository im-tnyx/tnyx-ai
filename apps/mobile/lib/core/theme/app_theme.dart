import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';

sealed class TnyxTheme {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: TnyxColors.lightBackground,
        colorScheme: const ColorScheme.light(
          primary: TnyxColors.brandPrimary,
          onPrimary: TnyxColors.brandOnPrimary,
          background: TnyxColors.lightBackground,
          onBackground: TnyxColors.lightOnBackground,
          surface: TnyxColors.lightBackground,
          onSurface: TnyxColors.lightOnBackground,
        ),
        textTheme: TnyxTypography.textTheme,
        useMaterial3: true,
        extensions: const <ThemeExtension<dynamic>>[TnyxDimens.defaults],
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: TnyxColors.darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: TnyxColors.brandPrimary,
          onPrimary: TnyxColors.brandOnPrimary,
          background: TnyxColors.darkBackground,
          onBackground: TnyxColors.darkOnBackground,
          surface: TnyxColors.darkBackground,
          onSurface: TnyxColors.darkOnBackground,
        ),
        textTheme: TnyxTypography.textTheme,
        useMaterial3: true,
        extensions: const <ThemeExtension<dynamic>>[TnyxDimens.defaults],
      );
}
