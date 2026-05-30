import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

class TnyxDynamicProgressBar extends StatelessWidget {
  const TnyxDynamicProgressBar({
    required this.progress,
    this.height,
    this.color,
    this.backgroundColor,
    super.key,
  });

  /// The progress value between 0.0 and 1.0
  final double progress;

  /// Custom height for the progress bar. Defaults to [TnyxDimens.progressBarHeight].
  final double? height;

  /// Custom color for the progress indicator. Defaults to [ColorScheme.primary].
  final Color? color;

  /// Custom background color. Defaults to [ColorScheme.surfaceContainerHighest] or equivalent.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    
    final actualHeight = height ?? TnyxDimens.progressBarHeight;
    final progressColor = color ?? colors.primary;
    final trackColor = backgroundColor ?? colors.onSurface.withOpacity(0.08);

    return Container(
      width: double.infinity,
      height: actualHeight,
      decoration: BoxDecoration(
        color: trackColor,
        borderRadius: BorderRadius.circular(TnyxDimens.radiusPill),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(TnyxDimens.radiusPill),
          ),
        ),
      ),
    );
  }
}
