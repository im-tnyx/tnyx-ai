import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/core/language/app_language.dart';
import 'package:tnyx_mobile/src/core/language/app_localized_strings.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/state/welcome_ui_state.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/action/welcome_action.dart';

class WelcomeViewModel extends ChangeNotifier {
  WelcomeViewModel() : _uiState = WelcomeUiState(
    strings: AppLocalizedStrings.from(AppLanguage.english),
  );

  WelcomeUiState _uiState;
  WelcomeUiState get uiState => _uiState;

  void onAction(WelcomeAction action) {
    switch (action) {
      case WelcomeLanguageChanged(localeCode: final code):
        _handleLanguageChange(code);
      case WelcomeGetStartedClicked():
        // Logic for Get Started
        break;
      case WelcomeSignInClicked():
        // Logic for Sign In
        break;
      case WelcomeSkipForNowClicked():
        // Logic for Skip
        break;
      case WelcomeTermsTapped():
      case WelcomePrivacyTapped():
        // Handled in Route
        break;
    }
  }

  void _handleLanguageChange(String code) {
    final language = AppLanguage.fromCode(code);
    _uiState = _uiState.copyWith(
      strings: AppLocalizedStrings.from(language),
    );
    notifyListeners();
  }
}
