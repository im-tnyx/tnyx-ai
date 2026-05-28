import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_shapes.dart';

sealed class TnyxSheetTheme {
  TnyxSheetTheme._();

  static final BottomSheetThemeData light =
  BottomSheetThemeData(
    elevation: TnyxDimens.elevationNone,

    modalElevation: TnyxDimens.elevationDialog,

    backgroundColor: TnyxColors.lightSurface,

    surfaceTintColor: TnyxColors.transparent,

    shadowColor: TnyxColors.transparent,

    showDragHandle: true,

    dragHandleColor:
    TnyxColors.lightTextMuted.withValues(
      alpha: 0.50,
    ),

    dragHandleSize: const Size(
      TnyxDimens.sheetHandleWidth,
      TnyxDimens.sheetHandleHeight,
    ),

    constraints: const BoxConstraints(
      maxWidth: TnyxDimens.screenMaxContentWidth,
    ),

    shape: TnyxShapes.sheetLight,
  );

  static final BottomSheetThemeData dark =
  BottomSheetThemeData(
    elevation: TnyxDimens.elevationNone,

    modalElevation: TnyxDimens.elevationDialog,

    backgroundColor: TnyxColors.darkSurface,

    surfaceTintColor: TnyxColors.transparent,

    shadowColor: TnyxColors.transparent,

    showDragHandle: true,

    dragHandleColor:
    TnyxColors.darkTextMuted.withValues(
      alpha: 0.50,
    ),

    dragHandleSize: const Size(
      TnyxDimens.sheetHandleWidth,
      TnyxDimens.sheetHandleHeight,
    ),

    constraints: const BoxConstraints(
      maxWidth: TnyxDimens.screenMaxContentWidth,
    ),

    shape: TnyxShapes.sheetDark,
  );
}