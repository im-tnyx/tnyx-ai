import 'package:flutter/material.dart';

@immutable
class TnyxDimens extends ThemeExtension<TnyxDimens> {
  const TnyxDimens({
    this.spacing4 = 4,
    this.spacing8 = 8,
    this.spacing12 = 12,
    this.spacing16 = 16,
    this.spacing20 = 20,
    this.spacing24 = 24,
    this.spacing32 = 32,
    this.spacing40 = 40,
    this.radius12 = 12,
    this.radius20 = 20,
  });

  final double spacing4;
  final double spacing8;
  final double spacing12;
  final double spacing16;
  final double spacing20;
  final double spacing24;
  final double spacing32;
  final double spacing40;
  final double radius12;
  final double radius20;

  static const TnyxDimens defaults = TnyxDimens();

  @override
  ThemeExtension<TnyxDimens> copyWith({
    double? spacing4,
    double? spacing8,
    double? spacing12,
    double? spacing16,
    double? spacing20,
    double? spacing24,
    double? spacing32,
    double? spacing40,
    double? radius12,
    double? radius20,
  }) {
    return TnyxDimens(
      spacing4: spacing4 ?? this.spacing4,
      spacing8: spacing8 ?? this.spacing8,
      spacing12: spacing12 ?? this.spacing12,
      spacing16: spacing16 ?? this.spacing16,
      spacing20: spacing20 ?? this.spacing20,
      spacing24: spacing24 ?? this.spacing24,
      spacing32: spacing32 ?? this.spacing32,
      spacing40: spacing40 ?? this.spacing40,
      radius12: radius12 ?? this.radius12,
      radius20: radius20 ?? this.radius20,
    );
  }

  @override
  ThemeExtension<TnyxDimens> lerp(
    covariant ThemeExtension<TnyxDimens>? other,
    double t,
  ) {
    if (other is! TnyxDimens) {
      return this;
    }
    return TnyxDimens(
      spacing4: _lerp(spacing4, other.spacing4, t),
      spacing8: _lerp(spacing8, other.spacing8, t),
      spacing12: _lerp(spacing12, other.spacing12, t),
      spacing16: _lerp(spacing16, other.spacing16, t),
      spacing20: _lerp(spacing20, other.spacing20, t),
      spacing24: _lerp(spacing24, other.spacing24, t),
      spacing32: _lerp(spacing32, other.spacing32, t),
      spacing40: _lerp(spacing40, other.spacing40, t),
      radius12: _lerp(radius12, other.radius12, t),
      radius20: _lerp(radius20, other.radius20, t),
    );
  }

  static double _lerp(double a, double b, double t) => a + (b - a) * t;
}

extension ThemeDimensX on BuildContext {
  TnyxDimens get dimens =>
      Theme.of(this).extension<TnyxDimens>() ?? TnyxDimens.defaults;
}
