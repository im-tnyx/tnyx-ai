import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';

class AppStatusColors {
  final Color success;
  final Color warning;
  final Color error;

  const AppStatusColors({
    required this.success,
    required this.warning,
    required this.error,
  });
}

extension AppStatusColorsExtension on BuildContext {
  AppStatusColors get statusColors {
    return const AppStatusColors(
      success: TnyxColors.success,
      warning: TnyxColors.warning,
      error: TnyxColors.error,
    );
  }
}
