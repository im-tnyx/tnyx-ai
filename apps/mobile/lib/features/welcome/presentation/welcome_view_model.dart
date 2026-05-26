import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/core/language/app_language.dart';
import 'package:tnyx_mobile/core/language/app_localized_strings.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_contract.dart';

class WelcomeViewModel extends ChangeNotifier {
  WelcomeViewModel()
    : _uiState = WelcomeUiState(
        strings: AppLocalizedStrings.from(AppLanguage.english),
        subtitle: _subtitleByLocaleCode('EN'),
      );

  WelcomeUiState _uiState;

  WelcomeUiState get uiState => _uiState;

  void syncLocalizedStrings(AppLocalizedStrings strings) {
    final nextSubtitle = _subtitleByLocaleCode(strings.localeCode);
    final didChange =
        _uiState.strings.localeCode != strings.localeCode ||
        _uiState.subtitle != nextSubtitle;

    if (!didChange) return;
    _uiState = _uiState.copyWith(strings: strings, subtitle: nextSubtitle);
    notifyListeners();
  }

  void onAction(WelcomeAction action) {
    switch (action) {
      case WelcomeGetStartedClicked():
        return;
      case WelcomeSignInClicked():
        return;
      case WelcomeSkipForNowClicked():
        return;
      case WelcomeLanguageClicked():
      case WelcomeTermsClicked():
      case WelcomePrivacyClicked():
        return;
    }
  }
}

String _subtitleByLocaleCode(String localeCode) {
  if (localeCode == 'HI') {
    return 'Nutrition, workouts aur recovery ko ek smart flow me manage karein.';
  }
  return 'Track nutrition, workouts, and recovery in one smart flow.';
}
