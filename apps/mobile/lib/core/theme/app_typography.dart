import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_fonts.dart';

sealed class TnyxTypography {
  static TextTheme textTheme = const TextTheme(
    displayMedium: TextStyle(
      fontFamily: TnyxFonts.primary,
      fontSize: 40,
      height: 1.2,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
    ),
    headlineSmall: TextStyle(
      fontFamily: TnyxFonts.primary,
      fontSize: 24,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: TnyxFonts.primary,
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontFamily: TnyxFonts.primary,
      fontSize: 16,
      height: 1.25,
      fontWeight: FontWeight.w600,
    ),
  );
}
