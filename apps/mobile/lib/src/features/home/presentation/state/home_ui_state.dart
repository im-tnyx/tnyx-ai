import 'package:flutter/foundation.dart';

@immutable
class HomeUiState {
  const HomeUiState({
    this.isRefreshing = false,
  });

  final bool isRefreshing;

  HomeUiState copyWith({
    bool? isRefreshing,
  }) {
    return HomeUiState(
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}
