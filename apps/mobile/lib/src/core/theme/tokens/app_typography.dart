import 'package:flutter/material.dart';

class TnyxTypography {
  static const String primaryFont = 'Inter';
  static const String secondaryFont = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
      fontFamily: primaryFont,
    ),
    displayMedium: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      letterSpacing: 0,
      fontFamily: primaryFont,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: primaryFont,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      fontFamily: primaryFont,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: secondaryFont,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: secondaryFont,
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      fontFamily: secondaryFont,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: primaryFont,
    ),
  );
}
