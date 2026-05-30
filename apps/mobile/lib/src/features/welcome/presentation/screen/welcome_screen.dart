import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';
import 'package:tnyx_mobile/src/core/language/app_language.dart';
import 'package:tnyx_mobile/src/core/language/widgets/language_bottom_sheet.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/state/welcome_ui_state.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/action/welcome_action.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/widgets/welcome_backdrop.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/widgets/welcome_disclaimer.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/widgets/welcome_feature_tile.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/widgets/welcome_actions.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/widgets/welcome_top_bar.dart';

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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Hero Image (Visible first)
          Align(
            alignment: const Alignment(0, -1.68),
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.75,
              child: Image.asset(
                'assets/images/welcome_hero.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          // 2. Backdrop Animation (Delayed Fade In)
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeIn,
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                child: const WelcomeBackdrop(),
              );
            },
          ),

          // 3. Content Animation (Delayed Slide + Fade In)
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1000),
            curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 30 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TnyxDimens.paddingScreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: TnyxDimens.spaceXS),
                    
                    WelcomeTopBar(
                      localeCode: state.localeCode,
                      skipText: state.skipText,
                      onSkip: () => onAction(const WelcomeSkipForNowClicked()),
                      onLanguageTap: () async {
                        final selected = await showLanguageBottomSheet(
                          context: context,
                          selectedLanguage: AppLanguage.fromCode(state.localeCode),
                          title: 'Select Language',
                          subtitle: 'Choose your preferred language for the app',
                          searchHint: 'Search language...',
                          noResultsText: 'No languages found',
                        );
                        if (selected != null) {
                          onAction(WelcomeLanguageChanged(selected.code));
                        }
                      },
                    ),

                    const Spacer(flex: 2),

                    Text(
                      state.title,
                      style: TnyxTypography.textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: TnyxDimens.spaceS),

                    ...state.featureLines.asMap().entries.map((entry) {
                      final index = entry.key;
                      final feature = entry.value;

                      final IconData featureIcon;
                      switch (index) {
                        case 0: featureIcon = Icons.camera_alt_outlined; break;
                        case 1: featureIcon = Icons.fitness_center_outlined; break;
                        case 2: featureIcon = Icons.psychology_outlined; break;
                        default: featureIcon = Icons.check_circle_outline;
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: TnyxDimens.spaceS),
                        child: WelcomeFeatureTile(
                          text: feature,
                          icon: featureIcon,
                        ),
                      );
                    }),

                    const SizedBox(height: TnyxDimens.spaceSM),

                    WelcomePrimaryButton(
                      text: state.ctaText,
                      onPressed: () => onAction(const WelcomeGetStartedClicked()),
                    ),

                    const SizedBox(height: TnyxDimens.spaceSM),

                    WelcomeSecondaryButton(
                      text: state.signInText,
                      onPressed: () => onAction(const WelcomeSignInClicked()),
                    ),

                    const SizedBox(height: TnyxDimens.spaceM),

                    WelcomeDisclaimer(
                      state: state,
                      onAction: onAction,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
