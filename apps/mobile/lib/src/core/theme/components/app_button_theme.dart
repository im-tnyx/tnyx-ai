import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_colors.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_shapes.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';

sealed class TnyxButtonTheme {
  TnyxButtonTheme._();

  /* -------------------------------------------------------------------------- */
  /*                               FILLED BUTTON                                */
  /* -------------------------------------------------------------------------- */

  static final FilledButtonThemeData filledLight =
  FilledButtonThemeData(
    style: FilledButton.styleFrom(
      elevation: TnyxDimens.elevationButton,

      minimumSize: const Size(
        double.infinity,
        TnyxDimens.buttonHeight,
      ),

      padding: TnyxDimens.buttonPadding,

      backgroundColor: TnyxColors.brandPrimary,

      foregroundColor: TnyxColors.brandOnPrimary,

      disabledBackgroundColor:
      TnyxColors.lightDisabled,

      disabledForegroundColor:
      TnyxColors.lightTextMuted,

      surfaceTintColor: TnyxColors.transparent,

      shape: TnyxShapes.button,

      textStyle:
      TnyxTypography.textTheme.labelLarge,
    ),
  );

  static final FilledButtonThemeData filledDark =
  FilledButtonThemeData(
    style: FilledButton.styleFrom(
      elevation: TnyxDimens.elevationButton,

      minimumSize: const Size(
        double.infinity,
        TnyxDimens.buttonHeight,
      ),

      padding: TnyxDimens.buttonPadding,

      backgroundColor: TnyxColors.brandPrimary,

      foregroundColor: TnyxColors.brandOnPrimary,

      disabledBackgroundColor:
      TnyxColors.darkDisabled,

      disabledForegroundColor:
      TnyxColors.darkTextMuted,

      surfaceTintColor: TnyxColors.transparent,

      shape: TnyxShapes.button,

      textStyle:
      TnyxTypography.textTheme.labelLarge,
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                              OUTLINED BUTTON                               */
  /* -------------------------------------------------------------------------- */

  static final OutlinedButtonThemeData outlinedLight =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: TnyxDimens.elevationNone,

      minimumSize: const Size(
        double.infinity,
        TnyxDimens.buttonHeight,
      ),

      padding: TnyxDimens.buttonPadding,

      foregroundColor:
      TnyxColors.lightOnBackground,

      disabledForegroundColor:
      TnyxColors.lightDisabled,

      side: const BorderSide(
        color: TnyxColors.lightOutline,
        width: TnyxDimens.borderThin,
      ),

      shape: TnyxShapes.button,

      textStyle:
      TnyxTypography.textTheme.labelLarge,
    ),
  );

  static final OutlinedButtonThemeData outlinedDark =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: TnyxDimens.elevationNone,

      minimumSize: const Size(
        double.infinity,
        TnyxDimens.buttonHeight,
      ),

      padding: TnyxDimens.buttonPadding,

      foregroundColor:
      TnyxColors.darkOnBackground,

      disabledForegroundColor:
      TnyxColors.darkDisabled,

      side: const BorderSide(
        color: TnyxColors.darkOutline,
        width: TnyxDimens.borderThin,
      ),

      shape: TnyxShapes.button,

      textStyle:
      TnyxTypography.textTheme.labelLarge,
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                                TEXT BUTTON                                 */
  /* -------------------------------------------------------------------------- */

  static final TextButtonThemeData textLight =
  TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: TnyxDimens.elevationNone,

      foregroundColor:
      TnyxColors.lightOnBackground,

      disabledForegroundColor:
      TnyxColors.lightDisabled,

      padding: const EdgeInsets.symmetric(
        horizontal: TnyxDimens.spaceSM,
        vertical: TnyxDimens.spaceXS,
      ),

      textStyle:
      TnyxTypography.textTheme.labelLarge,

      shape: TnyxShapes.button,
    ),
  );

  static final TextButtonThemeData textDark =
  TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: TnyxDimens.elevationNone,

      foregroundColor:
      TnyxColors.darkOnBackground,

      disabledForegroundColor:
      TnyxColors.darkDisabled,

      padding: const EdgeInsets.symmetric(
        horizontal: TnyxDimens.spaceSM,
        vertical: TnyxDimens.spaceXS,
      ),

      textStyle:
      TnyxTypography.textTheme.labelLarge,

      shape: TnyxShapes.button,
    ),
  );
}
