import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_contract.dart';

class WelcomeViewModel extends ChangeNotifier {
  WelcomeUiState _uiState = const WelcomeUiState();

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
    final normalizedCode = code.toLowerCase();
    if (normalizedCode == 'hi') {
      _uiState = _uiState.copyWith(
        localeCode: 'HI',
        skipText: 'छोड़ें',
        title: 'वसा घटाएं। मांसपेशियों का निर्माण करें।\nनिरंतर बने रहें।',
        featureLines: [
          'फोटो, आवाज या टेक्स्ट के साथ भोजन लॉग करें',
          'व्यक्तिगत वर्कआउट के साथ प्रो की तरह ट्रेन करें',
          'एआई से रीयल-टाइम अंतर्दृष्टि प्राप्त करें',
        ],
        ctaText: 'शुरू करें',
        signInText: 'साइन इन करें',
        termsPrefix: 'ऐप का उपयोग जारी रखकर, आप हमारे ',
        termsText: 'नियम और शर्तें',
        andText: ' और ',
        privacyText: 'गोपनीयता नीति स्वीकार करते हैं।',
      );
    } else {
      _uiState = const WelcomeUiState(localeCode: 'EN');
    }
    notifyListeners();
  }
}
