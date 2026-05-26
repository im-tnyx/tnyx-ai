import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/core/language/app_localized_strings.dart';

@immutable
class WelcomeUiState {
  const WelcomeUiState({
    required this.strings,
    required this.subtitle,
  });

  final AppLocalizedStrings strings;
  final String subtitle;

  WelcomeUiState copyWith({
    AppLocalizedStrings? strings,
    String? subtitle,
  }) {
    return WelcomeUiState(
      strings: strings ?? this.strings,
      subtitle: subtitle ?? this.subtitle,
    );
  }
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

class WelcomeTermsClicked extends WelcomeAction {
  const WelcomeTermsClicked();
}

class WelcomePrivacyClicked extends WelcomeAction {
  const WelcomePrivacyClicked();
}
