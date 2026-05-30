import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';

class WelcomeTopBar extends StatelessWidget {
  const WelcomeTopBar({
    required this.localeCode,
    required this.skipText,
    required this.onSkip,
    required this.onLanguageTap,
    super.key,
  });

  final String localeCode;
  final String skipText;
  final VoidCallback onSkip;
  final VoidCallback onLanguageTap;

  @override
  Widget build(BuildContext context) {
    final headerStyle = TnyxTypography.textTheme.titleMedium?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Language - Optimized ripple effect
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onLanguageTap,
            borderRadius: BorderRadius.circular(TnyxDimens.radiusSM),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TnyxDimens.spaceXS,
                vertical: TnyxDimens.spaceXXS,
              ),
              child: Text(
                localeCode.toUpperCase(),
                style: headerStyle,
              ),
            ),
          ),
        ),

        // Skip Button - Now matching the same ripple effect and padding as EN
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onSkip,
            borderRadius: BorderRadius.circular(TnyxDimens.radiusSM),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TnyxDimens.spaceXS,
                vertical: TnyxDimens.spaceXXS,
              ),
              child: Text(
                skipText,
                style: headerStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
