import 'package:flutter/foundation.dart';

@immutable
class AiRecentChatUiState {
  const AiRecentChatUiState({
    this.chats = const [],
    this.isLoading = false,
  });

  final List<String> chats; // Placeholder for chat objects
  final bool isLoading;

  AiRecentChatUiState copyWith({
    List<String>? chats,
    bool? isLoading,
  }) {
    return AiRecentChatUiState(
      chats: chats ?? this.chats,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
