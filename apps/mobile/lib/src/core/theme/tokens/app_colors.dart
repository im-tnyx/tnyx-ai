import 'package:flutter/material.dart';

class TnyxColors {
  TnyxColors._();

  // The Original Professional Color
  static const Color brandPrimary = xWhite;
  static const Color brandOnPrimary = xBlack;
  
  // Neutral Colors
  static const Color xWhite = Color(0xFFFFFFFF);
  static const Color xBlack = Color(0xFF000000);

  // Light Mode Defaults
  static const Color lightBackground = Color(0xFFF8F9FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF14171A);

  // Semantic Colors
  static const Color success = Color(0xFF0E8345);
  static const Color warning = Color(0xFFFFC043);
  static const Color error = Color(0xFFE11900);

  // Dynamic Color Helpers
  static Color getPrimary(ColorScheme dynamicScheme) => dynamicScheme.primary;
  static Color getBackground(ColorScheme dynamicScheme) => dynamicScheme.surface;
  static Color getSurface(ColorScheme dynamicScheme) => dynamicScheme.surfaceContainer;
  static Color getOnSurface(ColorScheme dynamicScheme) => dynamicScheme.onSurface;

  // Legacy Aliases for Compatibility
  static const Color actionCore = brandPrimary;
  static const Color primary = brandPrimary;
  static const Color lightOnBackground = lightOnSurface;
  static const Color darkOnBackground = xWhite;
  static const Color darkSurface = Color(0xFF121212); // Deep Grey, not pure black
  static const Color lightDisabled = Color(0xFFE0E0E0);
  static const Color darkDisabled = Color(0xFF333333);
  static const Color lightTextSecondary = Color(0xFF657786);
  static const Color darkTextSecondary = Color(0xFFAFAFAF);
  static const Color lightTextMuted = Color(0xFF657786);
  static const Color darkTextMuted = Color(0xFFAFAFAF);
  static const Color lightOutline = Color(0xFFE8E8E8);
  static const Color darkOutline = Color(0xFF292929);
  static const Color bottomNavBackground = Color(0xFF1A1A1A);
  static const Color transparent = Colors.transparent;
}
