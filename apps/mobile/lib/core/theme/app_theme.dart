import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_status_colors.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';

sealed class TnyxTheme {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: TnyxColors.lightBackground,
        colorScheme: const ColorScheme.light(
          primary: TnyxColors.brandPrimary,
          onPrimary: TnyxColors.brandOnPrimary,
          primaryContainer: TnyxColors.brandPrimaryContainer,
          onPrimaryContainer: TnyxColors.brandOnPrimaryContainer,
          surface: TnyxColors.lightSurface,
          onSurface: TnyxColors.lightOnSurface,
          surfaceContainerHighest: TnyxColors.lightSurfaceVariant,
          error: TnyxColors.error,
          onError: Colors.white,
        ),
        textTheme: TnyxTypography.textTheme,
        useMaterial3: true,
        extensions: const <ThemeExtension<dynamic>>[
          TnyxDimens.defaults,
          TnyxStatusColors.defaults,
        ],
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: TnyxColors.darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: TnyxColors.brandPrimary,
          onPrimary: TnyxColors.brandOnPrimary,
          primaryContainer: TnyxColors.brandOnPrimaryContainer,
          onPrimaryContainer: TnyxColors.brandPrimaryContainer,
          surface: TnyxColors.darkSurface,
          onSurface: TnyxColors.darkOnSurface,
          surfaceContainerHighest: TnyxColors.darkSurfaceVariant,
          error: TnyxColors.error,
          onError: Colors.white,
        ),
        textTheme: TnyxTypography.textTheme,
        useMaterial3: true,
        extensions: const <ThemeExtension<dynamic>>[
          TnyxDimens.defaults,
          TnyxStatusColors.defaults,
        ],
      );
}
