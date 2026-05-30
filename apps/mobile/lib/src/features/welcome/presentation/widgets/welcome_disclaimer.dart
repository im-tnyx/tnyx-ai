import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/state/welcome_ui_state.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/action/welcome_action.dart';

class WelcomeDisclaimer extends StatelessWidget {
  const WelcomeDisclaimer({
    required this.state,
    required this.onAction,
    super.key,
  });

  final WelcomeUiState state;
  final ValueChanged<WelcomeAction> onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final baseStyle = TnyxTypography.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
    );

    final linkStyle = TnyxTypography.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      decorationColor: theme.colorScheme.primary.withValues(alpha: 0.5),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TnyxDimens.spaceSM),
      child: Text.rich(
        TextSpan(
          style: baseStyle,
          children: [
            TextSpan(text: state.termsPrefix),
            TextSpan(
              text: state.termsText,
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => onAction(const WelcomeTermsTapped()),
            ),
            TextSpan(text: state.andText),
            TextSpan(
              text: state.privacyText,
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => onAction(const WelcomePrivacyTapped()),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}



