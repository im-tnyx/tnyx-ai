import 'package:flutter/material.dart';

sealed class TnyxColors {
  // Samsung One UI-inspired blue system.
  static const Color brandPrimary = Color(0xFF0381FE);
  static const Color brandOnPrimary = Color(0xFFFFFFFF);
  static const Color brandSecondary = Color(0xFF31D158);
  static const Color brandOnSecondary = Color(0xFFFFFFFF);
  static const Color brandAccent = Color(0xFF3E91FF);
  static const Color brandOnAccent = Color(0xFF001A33);

  static const Color lightPrimaryContainer = Color(0xFFDCEEFF);
  static const Color lightOnPrimaryContainer = Color(0xFF003A73);
  static const Color darkPrimaryContainer = Color(0xFF194D82);
  static const Color darkOnPrimaryContainer = Color(0xFFDCEEFF);

  static const Color lightBackground = Color(0xFFF7F8FA);
  static const Color lightOnBackground = Color(0xFF0F172A);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF0F172A);
  static const Color lightSurfaceVariant = Color(0xFFEFF3F8); // card
  static const Color lightOutline = Color(0xFFE2E8F0);

  // Dark theme tuned with One UI-like calm contrast.
  static const Color darkBackground = Color(0xFF0F1115);
  static const Color darkOnBackground = Color(0xFFF5F7FF);
  static const Color darkSurface = Color(0xFF161A22);
  static const Color darkOnSurface = Color(0xFFF5F7FF);
  static const Color darkSurfaceVariant = Color(0xFF1E2430); // card
  static const Color darkOutline = Color(0xFF2A3347);

  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
}
