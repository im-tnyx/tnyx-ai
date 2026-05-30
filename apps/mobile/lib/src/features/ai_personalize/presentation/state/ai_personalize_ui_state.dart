import 'package:flutter/foundation.dart';

@immutable
class AiPersonalizeUiState {
  const AiPersonalizeUiState({
    this.isLoading = false,
  });

  final bool isLoading;

  AiPersonalizeUiState copyWith({
    bool? isLoading,
  }) {
    return AiPersonalizeUiState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
