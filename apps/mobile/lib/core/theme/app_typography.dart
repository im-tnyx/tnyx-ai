import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_fonts.dart';

sealed class TnyxTypography {
  TnyxTypography._();

  static const String _fontFamily = TnyxFonts.primary;

  static const TextTheme textTheme = TextTheme(

    /* ---------------------------------------------------------------------- */
    /*                                 DISPLAY                                */
    /* ---------------------------------------------------------------------- */

    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 40,
      height: 1.15,
      letterSpacing: -0.4,
    ),

    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 34,
      height: 1.18,
      letterSpacing: -0.3,
    ),

    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 30,
      height: 1.2,
      letterSpacing: -0.2,
    ),

    /* ---------------------------------------------------------------------- */
    /*                                HEADLINES                               */
    /* ---------------------------------------------------------------------- */

    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 28,
      height: 1.22,
    ),

    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 1.25,
    ),

    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 20,
      height: 1.3,
    ),

    /* ---------------------------------------------------------------------- */
    /*                                  TITLES                                */
    /* ---------------------------------------------------------------------- */

    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.33,
    ),

    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 1.35,
    ),

    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.4,
    ),

    /* ---------------------------------------------------------------------- */
    /*                                   BODY                                 */
    /* ---------------------------------------------------------------------- */

    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
    ),

    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.45,
    ),

    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.4,
    ),

    /* ---------------------------------------------------------------------- */
    /*                              LABEL / BUTTON                            */
    /* ---------------------------------------------------------------------- */

    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 1.25,
      letterSpacing: 0.2,
    ),

    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.2,
      letterSpacing: 0.2,
    ),

    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 11,
      height: 1.2,
      letterSpacing: 0.3,
    ),
  );
}
