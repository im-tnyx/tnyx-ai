import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_contract.dart';

class WelcomeViewModel extends ChangeNotifier {
  final WelcomeUiState _uiState = const WelcomeUiState();

  WelcomeUiState get uiState => _uiState;

  void onAction(WelcomeAction action) {
    switch (action) {
      case WelcomeGetStartedClicked():
        return;
      case WelcomeSignInClicked():
        return;
      case WelcomeSkipForNowClicked():
        return;
      case WelcomeLanguageClicked():
        return;
    }
  }
}
