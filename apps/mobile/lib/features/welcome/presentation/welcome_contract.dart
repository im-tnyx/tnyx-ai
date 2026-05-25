import 'package:flutter/foundation.dart';

@immutable
class WelcomeUiState {
  const WelcomeUiState();
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

class WelcomeLanguageClicked extends WelcomeAction {
  const WelcomeLanguageClicked();
}
