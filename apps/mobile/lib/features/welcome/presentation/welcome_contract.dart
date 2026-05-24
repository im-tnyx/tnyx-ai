import 'package:flutter/foundation.dart';

@immutable
class WelcomeUiState {
  const WelcomeUiState({
    this.localeCode = 'EN',
    this.skipText = 'Skip for now',
    this.title = 'Lose Fat. Build Muscle.\nStay Consistent.',
    this.featureLines = const <String>[
      'Log meals with photos, voice, or text',
      'Train like a pro with personalized workouts',
      'Get realtime insights from AI that truly understands you',
    ],
    this.ctaText = 'Get Started',
    this.signInText = 'Sign In',
    this.termsPrefix = 'By continuing to use the app, you accept our ',
    this.termsText = 'Terms & Conditions',
    this.andText = ' and ',
    this.privacyText = 'Privacy Policy.',
  });

  final String localeCode;
  final String skipText;
  final String title;
  final List<String> featureLines;
  final String ctaText;
  final String signInText;
  final String termsPrefix;
  final String termsText;
  final String andText;
  final String privacyText;
}

sealed class WelcomeAction {
  const WelcomeAction();
}

class WelcomeGetStartedClicked extends WelcomeAction {
  const WelcomeGetStartedClicked();
}

class WelcomeSignInClicked extends WelcomeAction {
  const WelcomeSignInClicked();
}

class WelcomeSkipForNowClicked extends WelcomeAction {
  const WelcomeSkipForNowClicked();
}
