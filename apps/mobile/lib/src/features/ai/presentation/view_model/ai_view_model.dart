import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/state/ai_ui_state.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/action/ai_action.dart';

class AiViewModel extends ChangeNotifier {
  AiUiState _uiState = const AiUiState();
  AiUiState get uiState => _uiState;

  void onAction(AiAction action) {
  }
}
