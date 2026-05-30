import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/ai_recent_chat/presentation/state/ai_recent_chat_ui_state.dart';
import 'package:tnyx_mobile/src/features/ai_recent_chat/presentation/action/ai_recent_chat_action.dart';

class AiRecentChatViewModel extends ChangeNotifier {
  AiRecentChatViewModel() {
    // Initial dummy data
    _uiState = const AiRecentChatUiState(
      chats: [
        'How to build a Flutter app',
        'Healthy diet plan for 2024',
        'Workout routine for beginners',
        'Recent scientific discoveries',
      ],
    );
  }

  late AiRecentChatUiState _uiState;
  AiRecentChatUiState get uiState => _uiState;

  void onAction(AiRecentChatAction action) {
    switch (action) {
      case AiChatSelected():
        // Logic to switch chat
        break;
      case AiNewChatClicked():
        // Logic for new chat
        break;
    }
  }
}
