import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_colors.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

sealed class TnyxInputTheme {
  TnyxInputTheme._();

  static final InputDecorationTheme light = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100,
    contentPadding: TnyxDimens.inputPadding,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TnyxDimens.radiusM),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TnyxDimens.radiusM),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TnyxDimens.radiusM),
      borderSide: const BorderSide(color: TnyxColors.primary, width: 2),
    ),
  );

  static final InputDecorationTheme dark = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade900,
    contentPadding: TnyxDimens.inputPadding,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TnyxDimens.radiusM),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TnyxDimens.radiusM),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TnyxDimens.radiusM),
      borderSide: const BorderSide(color: TnyxColors.primary, width: 2),
    ),
  );
}

