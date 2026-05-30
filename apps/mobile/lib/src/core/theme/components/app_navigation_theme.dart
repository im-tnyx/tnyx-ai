import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_colors.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';

sealed class TnyxNavigationTheme {
  TnyxNavigationTheme._();

  static final NavigationBarThemeData light =
  NavigationBarThemeData(
    height: TnyxDimens.bottomNavHeight,

    backgroundColor: TnyxColors.lightSurface,

    surfaceTintColor: TnyxColors.transparent,

    shadowColor: TnyxColors.transparent,

    elevation: TnyxDimens.elevationNone,

    indicatorColor:
    TnyxColors.brandPrimary.withOpacity(0.12),

    iconTheme: WidgetStateProperty.resolveWith(
          (states) {
        final isSelected =
        states.contains(WidgetState.selected);

        return IconThemeData(
          size: TnyxDimens.bottomBarIcon,
          color: isSelected
              ? TnyxColors.brandPrimary
              : TnyxColors.lightTextSecondary,
        );
      },
    ),

    labelTextStyle:
    WidgetStateProperty.resolveWith(
          (states) {
        final isSelected =
        states.contains(WidgetState.selected);

        if (isSelected) {
          return TnyxTypography.textTheme.labelMedium
              ?.copyWith(
            color: TnyxColors.brandPrimary,
            fontWeight: FontWeight.w600,
          );
        }

        return TnyxTypography.textTheme.labelMedium
            ?.copyWith(
          color: TnyxColors.lightTextSecondary,
          fontWeight: FontWeight.w500,
        );
      },
    ),
  );

  static final NavigationBarThemeData dark =
  NavigationBarThemeData(
    height: TnyxDimens.bottomNavHeight,

    backgroundColor: TnyxColors.darkSurface,

    surfaceTintColor: TnyxColors.transparent,

    shadowColor: TnyxColors.transparent,

    elevation: TnyxDimens.elevationNone,

    indicatorColor:
    TnyxColors.brandPrimary.withOpacity(0.18),

    iconTheme: WidgetStateProperty.resolveWith(
          (states) {
        final isSelected =
        states.contains(WidgetState.selected);

        return IconThemeData(
          size: TnyxDimens.bottomBarIcon,
          color: isSelected
              ? TnyxColors.brandPrimary
              : TnyxColors.darkTextSecondary,
        );
      },
    ),

    labelTextStyle:
    WidgetStateProperty.resolveWith(
          (states) {
        final isSelected =
        states.contains(WidgetState.selected);

        if (isSelected) {
          return TnyxTypography.textTheme.labelMedium
              ?.copyWith(
            color: TnyxColors.brandPrimary,
            fontWeight: FontWeight.w600,
          );
        }

        return TnyxTypography.textTheme.labelMedium
            ?.copyWith(
          color: TnyxColors.darkTextSecondary,
          fontWeight: FontWeight.w500,
        );
      },
    ),
  );
}

