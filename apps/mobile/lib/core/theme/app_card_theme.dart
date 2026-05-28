import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_shapes.dart';

sealed class TnyxCardTheme {
  TnyxCardTheme._();

  static final CardThemeData light = CardThemeData(
    elevation: 0,
    color: TnyxColors.lightSurface,
    surfaceTintColor: TnyxColors.transparent,
    shape: TnyxShapes.cardLight,
  );

  static final CardThemeData dark = CardThemeData(
    elevation: 0,
    color: TnyxColors.darkSurface,
    surfaceTintColor: TnyxColors.transparent,
    shape: TnyxShapes.cardDark,
  );
}