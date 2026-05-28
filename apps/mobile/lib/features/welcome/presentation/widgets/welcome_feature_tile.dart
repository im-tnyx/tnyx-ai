import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';

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
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: TnyxDimens.spaceSM),
      decoration: BoxDecoration(
        // थीम के अनुसार हल्का बैकग्राउंड
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        // बटन जैसा राउंड (16px)
        borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
        border: Border.all(
          // थीम का प्राइमरी कलर बॉर्डर के लिए
          color: theme.colorScheme.primary.withValues(alpha: 0.3),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                width: 0.5,
              ),
            ),
            child: Icon(
              icon,
              color: theme.colorScheme.primary, // थीम का प्राइमरी कलर
              size: 20,
            ),
          ),

          const SizedBox(width: TnyxDimens.spaceM),

          // Text
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TnyxTypography.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500, // थोड़ा बोल्ड (Medium)
                height: 1.2,
              ),
            ),
          ),

          // Trailing Chevron
          Icon(
            Icons.chevron_right_rounded,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            size: 22,
          ),
        ],
      ),
    );
  }
}