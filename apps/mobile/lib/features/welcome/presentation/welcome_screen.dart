import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_contract.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    required this.state,
    required this.onAction,
    super.key,
  });

  final WelcomeUiState state;
  final ValueChanged<WelcomeAction> onAction;

  @override
  Widget build(BuildContext context) {
    final dims = context.dimens;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dims.spacing24,
            vertical: dims.spacing20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to TNYX',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              SizedBox(height: dims.spacing12),
              Text(
                state.title,
                style: textTheme.displayMedium?.copyWith(
                  color: colorScheme.onBackground,
                ),
              ),
              SizedBox(height: dims.spacing16),
              Text(
                state.subtitle,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.78),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => onAction(const WelcomeGetStartedClicked()),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: dims.spacing12),
                    child: Text(
                      state.ctaText,
                      style: textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
