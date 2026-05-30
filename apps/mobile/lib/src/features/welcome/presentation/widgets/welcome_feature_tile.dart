import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';

class WelcomeFeatureTile extends StatelessWidget {
  const WelcomeFeatureTile({
    required this.text,
    required this.icon,
    super.key,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: TnyxDimens.featureTileHeight,
      padding: const EdgeInsets.symmetric(horizontal: TnyxDimens.spaceS),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: TnyxDimens.opacityGlass),
        borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: TnyxDimens.opacitySubtle),
          width: TnyxDimens.borderSubtle,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: TnyxDimens.featureTileIconContainerSize,
            height: TnyxDimens.featureTileIconContainerSize,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: TnyxDimens.opacityLow),
              borderRadius: BorderRadius.circular(TnyxDimens.radiusFeatureIcon),
            ),
            child: Icon(
              icon,
              color: theme.colorScheme.primary,
              size: TnyxDimens.iconSizeXS,
            ),
          ),
          const SizedBox(width: TnyxDimens.spaceM),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TnyxTypography.textTheme.bodyMedium?.copyWith(
                // Suggestion: Using onSurfaceVariant (Muted Text) instead of onSurface (Pure White)
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: theme.colorScheme.onSurface.withValues(alpha: TnyxDimens.opacityMuted),
            size: TnyxDimens.iconSizeS,
          ),
        ],
      ),
    );
  }
}
