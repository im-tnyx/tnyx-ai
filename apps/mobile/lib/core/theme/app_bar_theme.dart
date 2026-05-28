import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';

sealed class TnyxAppBarTheme {
  TnyxAppBarTheme._();

  static final AppBarTheme light = AppBarTheme(
    elevation: TnyxDimens.elevationNone,
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    scrolledUnderElevation: TnyxDimens.elevationNone,
    centerTitle: false,
    backgroundColor: TnyxColors.transparent,
    foregroundColor: TnyxColors.lightOnBackground,
    surfaceTintColor: TnyxColors.transparent,
    shadowColor: TnyxColors.transparent,
    toolbarHeight: TnyxDimens.topBarHeight,
    titleSpacing: TnyxDimens.topBarPaddingHorizontal,
    iconTheme: const IconThemeData(
      size: TnyxDimens.topBarIcon,
      color: TnyxColors.lightOnBackground,
    ),
    actionsIconTheme: const IconThemeData(
      size: TnyxDimens.topBarIcon,
      color: TnyxColors.lightOnBackground,
    ),
    titleTextStyle: TnyxTypography.textTheme.titleLarge?.copyWith(
      color: TnyxColors.lightOnBackground,
    ),
  );

  static final AppBarTheme dark = AppBarTheme(
    elevation: TnyxDimens.elevationNone,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    scrolledUnderElevation: TnyxDimens.elevationNone,
    centerTitle: false,
    backgroundColor: TnyxColors.transparent,
    foregroundColor: TnyxColors.darkOnBackground,
    surfaceTintColor: TnyxColors.transparent,
    shadowColor: TnyxColors.transparent,
    toolbarHeight: TnyxDimens.topBarHeight,
    titleSpacing: TnyxDimens.topBarPaddingHorizontal,
    iconTheme: const IconThemeData(
      size: TnyxDimens.topBarIcon,
      color: TnyxColors.darkOnBackground,
    ),
    actionsIconTheme: const IconThemeData(
      size: TnyxDimens.topBarIcon,
      color: TnyxColors.darkOnBackground,
    ),
    titleTextStyle: TnyxTypography.textTheme.titleLarge?.copyWith(
      color: TnyxColors.darkOnBackground,
    ),
  );
}
