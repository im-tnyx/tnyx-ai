import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_shapes.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';

sealed class TnyxInputTheme {
  TnyxInputTheme._();

  static final InputDecorationTheme light =
  InputDecorationTheme(
    filled: true,

    fillColor: TnyxColors.lightSurfaceVariant,

    isDense: true,

    contentPadding: TnyxDimens.inputPadding,

    constraints: const BoxConstraints(
      minHeight: TnyxDimens.inputHeight,
    ),

    border: TnyxShapes.inputLight,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.lightOutline.withValues(
          alpha: 0.30,
        ),
        width: TnyxDimens.borderThin,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.brandPrimary,
        width: TnyxDimens.borderThick,
      ),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.error,
        width: TnyxDimens.borderThin,
      ),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.error,
        width: TnyxDimens.borderThick,
      ),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.lightDisabled,
        width: TnyxDimens.borderThin,
      ),
    ),

    hintStyle:
    TnyxTypography.textTheme.bodyMedium?.copyWith(
      color: TnyxColors.lightTextMuted,
    ),

    labelStyle:
    TnyxTypography.textTheme.bodyMedium?.copyWith(
      color: TnyxColors.lightTextSecondary,
    ),

    floatingLabelStyle:
    TnyxTypography.textTheme.bodySmall?.copyWith(
      color: TnyxColors.brandPrimary,
      fontWeight: FontWeight.w600,
    ),

    errorStyle:
    TnyxTypography.textTheme.bodySmall?.copyWith(
      color: TnyxColors.error,
    ),
  );

  static final InputDecorationTheme dark =
  InputDecorationTheme(
    filled: true,

    fillColor: TnyxColors.darkSurfaceVariant,

    isDense: true,

    contentPadding: TnyxDimens.inputPadding,

    constraints: const BoxConstraints(
      minHeight: TnyxDimens.inputHeight,
    ),

    border: TnyxShapes.inputDark,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.darkOutline.withValues(
          alpha: 0.40,
        ),
        width: TnyxDimens.borderThin,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.brandPrimary,
        width: TnyxDimens.borderThick,
      ),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.error,
        width: TnyxDimens.borderThin,
      ),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.error,
        width: TnyxDimens.borderThick,
      ),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        TnyxDimens.radiusInput,
      ),
      borderSide: BorderSide(
        color: TnyxColors.darkDisabled,
        width: TnyxDimens.borderThin,
      ),
    ),

    hintStyle:
    TnyxTypography.textTheme.bodyMedium?.copyWith(
      color: TnyxColors.darkTextMuted,
    ),

    labelStyle:
    TnyxTypography.textTheme.bodyMedium?.copyWith(
      color: TnyxColors.darkTextSecondary,
    ),

    floatingLabelStyle:
    TnyxTypography.textTheme.bodySmall?.copyWith(
      color: TnyxColors.brandPrimary,
      fontWeight: FontWeight.w600,
    ),

    errorStyle:
    TnyxTypography.textTheme.bodySmall?.copyWith(
      color: TnyxColors.error,
    ),
  );
}