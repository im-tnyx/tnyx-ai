import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_colors.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    required this.localeCode,
    required this.skipText,
    required this.title,
    required this.onSkip,
    super.key,
  });

  final String localeCode;
  final String skipText;
  final String title;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              localeCode,
              style: TnyxTypography
                  .textTheme.bodyLarge
                  ?.copyWith(
                color: TnyxColors.white,
              ),
            ),

            TextButton(
              onPressed: onSkip,
              style: TextButton.styleFrom(
                foregroundColor: TnyxColors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: TnyxDimens.spaceSM,
                  vertical: TnyxDimens.spaceXS,
                ),
              ),
              child: Text(
                skipText,
                style: TnyxTypography
                    .textTheme.labelLarge
                    ?.copyWith(
                  color: TnyxColors.white,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: TnyxDimens.spaceXL,
        ),

        Text(
          title,
          style: TnyxTypography
              .textTheme.displayMedium
              ?.copyWith(
            color: TnyxColors.white,
          ),
        ),
      ],
    );
  }
}