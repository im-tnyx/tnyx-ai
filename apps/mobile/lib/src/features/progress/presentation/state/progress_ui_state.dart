import 'package:flutter/foundation.dart';

enum ProgressTab { weight, measures, photos }

@immutable
class ProgressUiState {
  const ProgressUiState({
    this.selectedTab = ProgressTab.weight,
  });

  final ProgressTab selectedTab;

  ProgressUiState copyWith({
    ProgressTab? selectedTab,
  }) {
    return ProgressUiState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
