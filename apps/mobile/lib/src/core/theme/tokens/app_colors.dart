import 'package:flutter/material.dart';

class TnyxColors {
  TnyxColors._();

  // [TAG: INTERACTIVE ACCENT CORES]
  static const Color actionCore = Color(0xFF276EF1);

  // [TAG: SYSTEM STATE COLORS]
  static const Color alertCritical = Color(0xFFE11900);
  static const Color alertSuccess = Color(0xFF0E8345);
  static const Color alertWarning = Color(0xFFFFC043);

  // [TAG: LIGHT MODE LAYER TOKENS]
  static const Color lightCanvasBackground = Color(0xFFFFFFFF);
  static const Color lightSurfaceContainer = Color(0xFFF6F6F6);
  static const Color lightHighContrastText = Color(0xFF1F1F1F);
  static const Color lightLowContrastText = Color(0xFF545454);
  static const Color lightComponentOutline = Color(0xFFE8E8E8);
  static const Color lightOnSystemState = Color(0xFFFFFFFF);
  static const Color lightOnSystemWarning = Color(0xFF1F1F1F);

  // [TAG: DARK MODE LAYER TOKENS]
  static const Color darkCanvasBackground = Color(0xFF000000);
  static const Color darkSurfaceContainer = Color(0xFF121212);
  static const Color darkPrimaryContainer = Color(0xFF001233); // Premium Blue is Back
  static const Color darkHighContrastText = Color(0xFFFFFFFF);
  static const Color darkLowContrastText = Color(0xFFAFAFAF);
  static const Color darkComponentOutline = Color(0xFF292929);
  static const Color darkOnSystemState = Color(0xFFFFFFFF);
  static const Color darkOnSystemWarning = Color(0xFF1F1F1F);

  // Semantic Aliases
  static const Color primary = lightHighContrastText;
  static const Color secondary = actionCore;
  static const Color error = alertCritical;
  static const Color success = alertSuccess;
  static const Color warning = alertWarning;

  // Specific Aliases for existing themes
  static const Color brandPrimary = actionCore;
  static const Color brandOnPrimary = Color(0xFFFFFFFF);
  
  static const Color lightSurface = lightCanvasBackground;
  static const Color darkSurface = darkSurfaceContainer;
  
  static const Color lightOnBackground = lightHighContrastText;
  static const Color darkOnBackground = darkHighContrastText;
  
  static const Color lightDisabled = Color(0xFFE0E0E0);
  static const Color darkDisabled = Color(0xFF333333);
  
  static const Color lightTextMuted = lightLowContrastText;
  static const Color darkTextMuted = darkLowContrastText;
  
  static const Color lightTextSecondary = lightLowContrastText;
  static const Color darkTextSecondary = darkLowContrastText;
  
  static const Color lightOutline = lightComponentOutline;
  static const Color darkOutline = darkComponentOutline;

  static const Color bottomNavBackground = Color(0xFF1A1A1A);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
}
