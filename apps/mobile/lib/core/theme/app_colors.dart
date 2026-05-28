import 'package:flutter/material.dart';

sealed class TnyxColors {
  TnyxColors._();

  /* -------------------------------------------------------------------------- */
  /*                                   CORE                                     */
  /* -------------------------------------------------------------------------- */

  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  static const Color transparent = Color(0x00000000);

  /* -------------------------------------------------------------------------- */
  /*                                   BRAND                                    */
  /* -------------------------------------------------------------------------- */

  static const Color brandPrimary = Color(0xFF4F46E5);

  static const Color brandOnPrimary = white;

  static const Color brandPrimaryContainer =
  Color(0xFFE0E7FF);

  static const Color brandOnPrimaryContainer =
  Color(0xFF1E1B4B);

  /* -------------------------------------------------------------------------- */
  /*                                LIGHT THEME                                 */
  /* -------------------------------------------------------------------------- */

  static const Color lightBackground =
  Color(0xFFF7F8FC);

  static const Color lightOnBackground =
  Color(0xFF111827);

  static const Color lightSurface =
  Color(0xFFFFFFFF);

  static const Color lightOnSurface =
  Color(0xFF111827);

  static const Color lightSurfaceVariant =
  Color(0xFFE8ECF7);

  static const Color lightOutline =
  Color(0xFFD0D7E2);

  static const Color lightDivider =
  Color(0xFFE5EAF3);

  static const Color lightTextSecondary =
  Color(0xFF6B7280);

  static const Color lightTextMuted =
  Color(0xFF9CA3AF);

  static const Color lightGlass =
  Color(0x14FFFFFF);

  static const Color lightOverlay =
  Color(0x66000000);

  static const Color lightDisabled =
  Color(0xFFB0B7C3);

  /* -------------------------------------------------------------------------- */
  /*                              AMOLED DARK THEME                             */
  /* -------------------------------------------------------------------------- */

  static const Color darkBackground =
  Color(0xFF000000);

  static const Color darkOnBackground =
  Color(0xFFF5F7FF);

  static const Color darkSurface =
  Color(0xFF0B0F14);

  static const Color darkOnSurface =
  Color(0xFFF5F7FF);

  static const Color darkSurfaceVariant =
  Color(0xFF111821);

  static const Color darkOutline =
  Color(0xFF243041);

  static const Color darkDivider =
  Color(0xFF1A2230);

  static const Color darkTextSecondary =
  Color(0xFF9AA4B2);

  static const Color darkTextMuted =
  Color(0xFF6B7280);

  static const Color darkGlass =
  Color(0x14FFFFFF);

  static const Color darkOverlay =
  Color(0x99000000);

  static const Color darkDisabled =
  Color(0xFF4B5563);

  /* -------------------------------------------------------------------------- */
  /*                                   STATUS                                   */
  /* -------------------------------------------------------------------------- */

  static const Color success =
  Color(0xFF16A34A);

  static const Color warning =
  Color(0xFFEAB308);

  static const Color error =
  Color(0xFFDC2626);

  static const Color errorContainerLight =
  Color(0xFFFFE2E0);

  static const Color onErrorContainerLight =
  Color(0xFF410002);

  static const Color errorContainerDark =
  Color(0xFF4A1515);

  static const Color onErrorContainerDark =
  Color(0xFFFFDAD6);

  /* -------------------------------------------------------------------------- */
  /*                               WELCOME SCREEN                               */
  /* -------------------------------------------------------------------------- */

  static const Color welcomePrimaryButton =
      white;

  static const Color welcomePrimaryButtonForeground =
      black;

  static const Color welcomeSecondaryButton =
  Color(0xFF16181E);

  static const Color welcomeSecondaryButtonForeground =
      white;

  static const Color welcomeFeatureTile =
  Color(0xFF0D0F14);

/* -------------------------------------------------------------------------- */
/*                                  OVERLAYS                                  */
/* -------------------------------------------------------------------------- */

  static const Color overlayLight =
  Color(0x3005080E);
  static const Color overlayMedium =
  Color(0x8005080E);
  static const Color overlayHeavy =
  Color(0xCC05080E);
  static const Color overlayMax =
  Color(0xFF05080E);
  static const Color cinematicBlack =
  Color(0xFF05080E);
}