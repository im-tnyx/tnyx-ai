import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/state/shell_ui_state.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/action/shell_action.dart';

class ShellViewModel extends ChangeNotifier {
  ShellUiState _uiState = const ShellUiState();
  ShellUiState get uiState => _uiState;

  void onAction(ShellAction action) {
    switch (action) {
      case ShellTabSelected(tab: final tab):
        _selectTab(tab);
        break;
      case ShellScrollChanged(offset: final offset):
        _handleScroll(offset);
        break;
      case ShellPremiumClicked():
      case ShellStreakClicked():
      case ShellProfileClicked():
        // Handled in Route for navigation
        break;
    }
  }

  void _handleScroll(double offset) {
    const threshold = 200.0;
    final double opacity = (offset / threshold).clamp(0.0, 1.0);
    
    if (_uiState.appBarOpacity != opacity) {
      _uiState = _uiState.copyWith(appBarOpacity: opacity);
      notifyListeners();
    }
  }

  void _selectTab(ShellTab tab) {
    if (_uiState.selectedTab == tab) return;
    _uiState = _uiState.copyWith(selectedTab: tab);
    notifyListeners();
  }
}
