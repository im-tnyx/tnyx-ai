import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/language/app_localized_strings.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_contract.dart';
import 'package:flutter/gestures.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    required this.uiState,
    required this.onAction,
    super.key,
  });

  final WelcomeUiState uiState;
  final ValueChanged<WelcomeAction> onAction;

  @override
  Widget build(BuildContext context) {
    final strings = uiState.strings;
    final dims = context.dimens;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const _HeroBackgroundImage(),
          const _BackdropLayer(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final height = constraints.maxHeight;
                final isCompact = height < 760;
                final isTiny = height < 680;
                final titleSize = isTiny
                    ? 44.0
                    : isCompact
                    ? 48.0
                    : 52.0;
                final titleLineHeight = isTiny ? 1.02 : 1.06;

                return Padding(
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
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color(0x99111418),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: TextButton(
                              onPressed: () =>
                                  onAction(const WelcomeLanguageClicked()),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                textStyle: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(strings.localeCode),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                onAction(const WelcomeSkipForNowClicked()),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              textStyle: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            child: Text(strings.skipText),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        strings.welcomeTitle,
                        maxLines: 2,
                        style: textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: titleSize,
                          height: titleLineHeight,
                        ),
                      ),
                      SizedBox(height: isTiny ? 6 : dims.spacing8),
                      Text(
                        uiState.subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.86),
                          height: 1.3,
                          fontSize: isTiny ? 14 : 15,
                        ),
                      ),
                      SizedBox(height: isTiny ? 12 : dims.spacing20),
                      ...List<Widget>.generate(
                        strings.featureLines.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: isTiny ? 8 : 12),
                          child: _FeatureTile(
                            text: strings.featureLines[index],
                            icon: _featureIconByIndex(index),
                            compact: isTiny,
                          ),
                        ),
                      ),
                      SizedBox(height: isTiny ? 10 : 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () =>
                              onAction(const WelcomeGetStartedClicked()),
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
                            padding: EdgeInsets.symmetric(
                              vertical: isTiny ? 13 : dims.spacing16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(dims.radius12),
                            ),
                            side: BorderSide(
                              color: Colors.white.withValues(alpha: 0.15),
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    strings.getStartedText,
                                    style: textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(Icons.arrow_forward_rounded, size: 20),
                              const SizedBox(width: 14),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: isTiny ? 10 : dims.spacing12),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () =>
                              onAction(const WelcomeSignInClicked()),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.35),
                              width: 1,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: isTiny ? 13 : dims.spacing16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(dims.radius12),
                            ),
                          ),
                          child: Text(
                            strings.signInText,
                            style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: isTiny ? 10 : dims.spacing12),
                      _DisclaimerText(
                        strings: strings,
                        onTermsTap: () =>
                            onAction(const WelcomeTermsClicked()),
                        onPrivacyTap: () =>
                            onAction(const WelcomePrivacyClicked()),
                      ),
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

IconData _featureIconByIndex(int index) {
  switch (index) {
    case 0:
      return Icons.camera_alt_outlined;
    case 1:
      return Icons.fitness_center_rounded;
    default:
      return Icons.psychology_alt_rounded;
  }
}

class _BackdropLayer extends StatelessWidget {
  const _BackdropLayer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              // Matches welcome.tsx heroTop gradient.
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF05080E).withValues(alpha: 0.18),
                  const Color(0xFF05080E).withValues(alpha: 0.08),
                  const Color(0xFF05080E).withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.35, 1.0],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.82,
            child: DecoratedBox(
              decoration: BoxDecoration(
                // Matches welcome.tsx heroBottom gradient.
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF05080E).withValues(alpha: 0.0),
                    const Color(0xFF05080E).withValues(alpha: 0.50),
                    const Color(0xFF05080E).withValues(alpha: 1.0),
                    const Color(0xFF05080E).withValues(alpha: 1.0),
                    const Color(0xFF05080E).withValues(alpha: 1.0),
                    const Color(0xFF05080E).withValues(alpha: 1.0),
                    const Color(0xFF05080E).withValues(alpha: 1.0),
                    const Color(0xFF05080E).withValues(alpha: 1.0),
                  ],
                  stops: const [0.0, 0.14, 0.28, 0.42, 0.56, 0.70, 0.84, 1.0],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroBackgroundImage extends StatelessWidget {
  const _HeroBackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1.5),
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.75,
        child: Image.asset(
          'assets/images/welcome_hero.png',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF050505),
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.white.withOpacity(0.7),
                  size: 42,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.text,
    required this.icon,
    required this.compact,
  });

  final String text;
  final IconData icon;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0D0F14).withOpacity(0.94),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: compact ? 11 : 13,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: compact ? 32 : 34,
            height: compact ? 32 : 34,
            decoration: BoxDecoration(
              color: const Color(0xFF151B2A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF8EA5FF), size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: 1.2,
                fontSize: compact ? 14.5 : 16,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Icon(
            Icons.chevron_right_rounded,
            color: Colors.white.withOpacity(0.65),
            size: 22,
          ),
        ],
      ),
    );
  }
}

class _DisclaimerText extends StatefulWidget {
  const _DisclaimerText({
    required this.strings,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  final AppLocalizedStrings strings;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  @override
  State<_DisclaimerText> createState() => _DisclaimerTextState();
}

class _DisclaimerTextState extends State<_DisclaimerText> {
  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();

    _termsRecognizer = TapGestureRecognizer()
      ..onTap = widget.onTermsTap;

    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = widget.onPrivacyTap;
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final baseStyle = textTheme.bodyLarge?.copyWith(
      color: Colors.white70,
      fontSize: 13,
      height: 1.35,
      fontWeight: FontWeight.w500,
    );

    final linkStyle = baseStyle?.copyWith(
      color: const Color(0xFF8EA5FF),
      fontWeight: FontWeight.w800,
      decoration: TextDecoration.underline,
      decorationColor: const Color(0xFF8EA5FF),
    );

    return Center(
      child: Semantics(
        label:
        '${widget.strings.termsPrefix} ${widget.strings.termsText} ${widget.strings.andText} ${widget.strings.privacyText}',
        child: Text.rich(
          TextSpan(
            style: baseStyle,
            children: [
              TextSpan(text: widget.strings.termsPrefix),
              TextSpan(
                text: widget.strings.termsText,
                style: linkStyle,
                recognizer: _termsRecognizer,
              ),
              TextSpan(text: widget.strings.andText),
              TextSpan(
                text: widget.strings.privacyText,
                style: linkStyle,
                recognizer: _privacyRecognizer,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
