import 'package:flutter/foundation.dart';

enum ShellTab { home, nutrition, ai, workout, progress }

@immutable
class ShellUiState {
  const ShellUiState({
    this.selectedTab = ShellTab.home,
    this.appBarOpacity = 0.0,
  });

  final ShellTab selectedTab;
  final double appBarOpacity;

  ShellUiState copyWith({
    ShellTab? selectedTab,
    double? appBarOpacity,
  }) {
    return ShellUiState(
      selectedTab: selectedTab ?? this.selectedTab,
      appBarOpacity: appBarOpacity ?? this.appBarOpacity,
    );
  }
}
