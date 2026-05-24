import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';

@immutable
class TnyxStatusColors extends ThemeExtension<TnyxStatusColors> {
  const TnyxStatusColors({
    required this.success,
    required this.warning,
    required this.error,
  });

  final Color success;
  final Color warning;
  final Color error;

  static const TnyxStatusColors defaults = TnyxStatusColors(
    success: TnyxColors.success,
    warning: TnyxColors.warning,
    error: TnyxColors.error,
  );

  @override
  ThemeExtension<TnyxStatusColors> copyWith({
    Color? success,
    Color? warning,
    Color? error,
  }) {
    return TnyxStatusColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<TnyxStatusColors> lerp(
    covariant ThemeExtension<TnyxStatusColors>? other,
    double t,
  ) {
    if (other is! TnyxStatusColors) return this;
    return TnyxStatusColors(
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      error: Color.lerp(error, other.error, t) ?? error,
    );
  }
}

extension ThemeStatusColorsX on BuildContext {
  TnyxStatusColors get statusColors =>
      Theme.of(this).extension<TnyxStatusColors>() ?? TnyxStatusColors.defaults;
}
