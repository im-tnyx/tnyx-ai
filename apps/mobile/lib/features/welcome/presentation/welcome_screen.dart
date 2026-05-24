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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/welcome_hero.png',
            fit: BoxFit.cover,
          ),
          const _BackdropLayer(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: dims.spacing20,
                    vertical: dims.spacing16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.localeCode,
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                onAction(const WelcomeSkipForNowClicked()),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              textStyle: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: Text(state.skipText),
                          ),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.22),
                      Text(
                        state.title,
                        style: textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(height: dims.spacing20),
                      ...state.featureLines.map(
                        (feature) => Padding(
                          padding: EdgeInsets.only(bottom: dims.spacing12),
                          child: _FeatureTile(text: feature),
                        ),
                      ),
                      SizedBox(height: dims.spacing8),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () =>
                              onAction(const WelcomeGetStartedClicked()),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding:
                                EdgeInsets.symmetric(vertical: dims.spacing16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(dims.radius12),
                            ),
                          ),
                          child: Text(
                            state.ctaText,
                            style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: dims.spacing12),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () =>
                              onAction(const WelcomeSignInClicked()),
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF16181E),
                            foregroundColor: Colors.white,
                            padding:
                                EdgeInsets.symmetric(vertical: dims.spacing16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(dims.radius12),
                            ),
                          ),
                          child: Text(
                            state.signInText,
                            style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: dims.spacing12),
                      _DisclaimerText(state: state),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BackdropLayer extends StatelessWidget {
  const _BackdropLayer();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.12),
            Colors.black.withValues(alpha: 0.46),
            Colors.black.withValues(alpha: 0.78),
            Colors.black.withValues(alpha: 0.93),
          ],
          stops: const [0.0, 0.35, 0.7, 1.0],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0D0F14).withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DisclaimerText extends StatelessWidget {
  const _DisclaimerText({required this.state});

  final WelcomeUiState state;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white70,
          fontSize: 14,
          height: 1.3,
        );
    final linkStyle = style?.copyWith(
      decoration: TextDecoration.underline,
      color: Colors.white70,
    );

    return Center(
      child: Text.rich(
        TextSpan(
          style: style,
          children: [
            TextSpan(text: state.termsPrefix),
            TextSpan(text: state.termsText, style: linkStyle),
            TextSpan(text: state.andText),
            TextSpan(text: state.privacyText, style: linkStyle),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
