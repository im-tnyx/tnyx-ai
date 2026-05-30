import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/state/progress_ui_state.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/action/progress_action.dart';

class ProgressViewModel extends ChangeNotifier {
  ProgressUiState _uiState = const ProgressUiState();
  ProgressUiState get uiState => _uiState;

  void onAction(ProgressAction action) {
    switch (action) {
      case ProgressTabSelected(tab: final tab):
        _selectTab(tab);
        break;
    }
  }

  void _selectTab(ProgressTab tab) {
    if (_uiState.selectedTab == tab) return;
    _uiState = _uiState.copyWith(selectedTab: tab);
    notifyListeners();
  }
}
