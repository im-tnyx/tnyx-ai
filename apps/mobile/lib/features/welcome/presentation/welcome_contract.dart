import 'package:flutter/foundation.dart';

@immutable
class WelcomeUiState {
  const WelcomeUiState({
    this.title = 'Train Smart. Eat Better. Recover Stronger.',
    this.subtitle =
        'TNYX keeps your workouts, nutrition, and recovery in one adaptive flow.',
    this.ctaText = 'Get Started',
  });

  final String title;
  final String subtitle;
  final String ctaText;
}

sealed class WelcomeAction {
  const WelcomeAction();
}

class WelcomeGetStartedClicked extends WelcomeAction {
  const WelcomeGetStartedClicked();
}
