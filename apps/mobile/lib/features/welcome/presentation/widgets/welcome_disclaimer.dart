import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_contract.dart';

class WelcomeDisclaimer extends StatelessWidget {
  const WelcomeDisclaimer({
    required this.state,
    super.key,
  });

  final WelcomeUiState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // सामान्य टेक्स्ट के लिए स्टाइल
    final baseStyle = TnyxTypography.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
    );

    // क्लिक करने वाले (Links) के लिए स्टाइल
    final linkStyle = TnyxTypography.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      decorationColor: theme.colorScheme.primary.withValues(alpha: 0.5),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TnyxDimens.spaceSM),
      child: Text.rich(
        TextSpan(
          style: baseStyle,
          children: [
            TextSpan(text: state.termsPrefix),
            TextSpan(
              text: state.termsText,
              style: linkStyle,
            // यहाँ  recognizer: TapGestureRecognizer()..onTap = ...
            ),
            TextSpan(text: state.andText),
            TextSpan(
              text: state.privacyText,
              style: linkStyle,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}