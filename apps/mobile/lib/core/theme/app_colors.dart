import 'package:flutter/material.dart';

sealed class TnyxColors {
  static const Color brandPrimary = Color(0xFF4F46E5);
  static const Color brandOnPrimary = Color(0xFFFFFFFF);
  static const Color brandPrimaryContainer = Color(0xFFE0E7FF);
  static const Color brandOnPrimaryContainer = Color(0xFF1E1B4B);

  static const Color lightBackground = Color(0xFFF7F8FC);
  static const Color lightOnBackground = Color(0xFF111827);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF111827);
  static const Color lightSurfaceVariant = Color(0xFFE8ECF7);

  // AMOLED-friendly near-black palette.
  static const Color darkBackground = Color(0xFF050505);
  static const Color darkOnBackground = Color(0xFFF5F7FF);
  static const Color darkSurface = Color(0xFF0B0B0D);
  static const Color darkOnSurface = Color(0xFFF5F7FF);
  static const Color darkSurfaceVariant = Color(0xFF15151A);

  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFFACC15);
  static const Color error = Color(0xFFDC2626);
}
