import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/ai_personalize/presentation/state/ai_personalize_ui_state.dart';
import 'package:tnyx_mobile/src/features/ai_personalize/presentation/action/ai_personalize_action.dart';

class AiPersonalizeViewModel extends ChangeNotifier {
  AiPersonalizeUiState _uiState = const AiPersonalizeUiState();
  AiPersonalizeUiState get uiState => _uiState;

  void onAction(AiPersonalizeAction action) {
    switch (action) {
      case AiPersonalizeBackClicked():
        // Handled in Route
        break;
      case AiPersonalizeSaveClicked():
        _handleSave();
        break;
    }
  }

  Future<void> _handleSave() async {
    _uiState = _uiState.copyWith(isLoading: true);
    notifyListeners();

    // Simulate save API call
    await Future.delayed(const Duration(seconds: 1));

    _uiState = _uiState.copyWith(isLoading: false);
    notifyListeners();
  }
}
