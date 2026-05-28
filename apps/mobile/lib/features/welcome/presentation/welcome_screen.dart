import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/theme/app_dimens.dart';
import 'package:tnyx_mobile/core/theme/app_typography.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_contract.dart';
import 'package:tnyx_mobile/features/welcome/presentation/widgets/welcome_backdrop.dart';
import 'package:tnyx_mobile/features/welcome/presentation/widgets/welcome_disclaimer.dart';
import 'package:tnyx_mobile/features/welcome/presentation/widgets/welcome_feature_tile.dart';
import 'package:tnyx_mobile/features/welcome/presentation/widgets/welcome_actions.dart';
import 'package:tnyx_mobile/features/welcome/presentation/widgets/language_selection_sheet.dart';

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
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Hero Image
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

          const WelcomeBackdrop(),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: TnyxDimens.paddingScreen,
                    right: TnyxDimens.paddingScreen,
                    top: TnyxDimens.spaceXS,
                    bottom: TnyxDimens.spaceNone,
                  ),
                  child: SizedBox.expand(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Updated Top Bar
                        _TopBar(
                          localeCode: state.localeCode,
                          skipText: state.skipText,
                          onSkip: () {
                            onAction(const WelcomeSkipForNowClicked());
                          },
                          onLanguageTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(TnyxDimens.radiusCard),
                                ),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              builder: (context) => LanguageSelectionSheet(
                                currentLocale: state.localeCode,
                                onLanguageSelected: (newLang) {
                                  onAction(WelcomeLanguageChanged(newLang));
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                        ),

                        const Spacer(flex: 2),

                        // Title and Features
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.title,
                              style: TnyxTypography.textTheme.displayMedium?.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: TnyxDimens.spaceS),

                            // Dynamic Feature Tiles with Icons
                            ...state.featureLines.asMap().entries.map(
                                  (entry) {
                                final index = entry.key;
                                final feature = entry.value;

                                // Icon mapping based on your React Native code
                                final IconData featureIcon;
                                switch (index) {
                                  case 0:
                                    featureIcon = Icons.camera_alt_outlined;
                                    break;
                                  case 1:
                                    featureIcon = Icons.fitness_center_outlined;
                                    break;
                                  case 2:
                                    featureIcon = Icons.psychology_outlined;
                                    break;
                                  default:
                                    featureIcon = Icons.check_circle_outline;
                                }

                                return Padding(
                                  padding: EdgeInsets.only(bottom: TnyxDimens.spaceS),
                                  child: WelcomeFeatureTile(
                                    text: feature,
                                    icon: featureIcon,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: TnyxDimens.spaceM),

                        // Actions
                        WelcomePrimaryButton(
                          text: state.ctaText,
                          onPressed: () {
                            onAction(const WelcomeGetStartedClicked());
                          },
                        ),

                        SizedBox(height: TnyxDimens.spaceSM),

                        WelcomeSecondaryButton(
                          text: state.signInText,
                          onPressed: () {
                            onAction(const WelcomeSignInClicked());
                          },
                        ),

                        SizedBox(height: TnyxDimens.spaceM),

                        // Updated Disclaimer
                        WelcomeDisclaimer(state: state),
                      ],
                    ),
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

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.localeCode,
    required this.skipText,
    required this.onSkip,
    required this.onLanguageTap,
  });

  final String localeCode;
  final String skipText;
  final VoidCallback onSkip;
  final VoidCallback onLanguageTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // हेडर के लिए कॉमन टेक्स्ट स्टाइल
    final headerStyle = TnyxTypography.textTheme.titleMedium?.copyWith(
      color: theme.colorScheme.onSurface,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Language Code (e.g., EN) - Now Clickable
        InkWell(
          onTap: onLanguageTap,
          borderRadius: BorderRadius.circular(TnyxDimens.radiusPill),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TnyxDimens.spaceS,
              vertical: TnyxDimens.spaceXS,
            ),
            child: Text(
              localeCode.toUpperCase(),
              style: headerStyle,
            ),
          ),
        ),

        // Skip Button
        TextButton(
          onPressed: onSkip,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: TnyxDimens.spaceS),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            skipText,
            style: headerStyle,
          ),
        ),
      ],
    );
  }
}
