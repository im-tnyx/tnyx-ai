import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_colors.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_shapes.dart';

sealed class TnyxCardTheme {
  TnyxCardTheme._();

  static const CardThemeData light = CardThemeData(
    elevation: 0,
    color: TnyxColors.lightSurface,
    surfaceTintColor: TnyxColors.transparent,
    shape: TnyxShapes.cardLight,
  );

  static const CardThemeData dark = CardThemeData(
    elevation: 0,
    color: TnyxColors.darkSurface,
    surfaceTintColor: TnyxColors.transparent,
    shape: TnyxShapes.cardDark,
  );
}
