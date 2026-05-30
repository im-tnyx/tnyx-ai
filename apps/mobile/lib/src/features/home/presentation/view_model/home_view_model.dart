import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/home/presentation/state/home_ui_state.dart';
import 'package:tnyx_mobile/src/features/home/presentation/action/home_action.dart';

class HomeViewModel extends ChangeNotifier {
  HomeUiState _uiState = const HomeUiState();
  HomeUiState get uiState => _uiState;

  void onAction(HomeAction action) {
    switch (action) {
      case HomeRefreshRequested():
        _handleRefresh();
        break;
      case HomeInternalAction():
        break;
    }
  }

  Future<void> _handleRefresh() async {
    _uiState = _uiState.copyWith(isRefreshing: true);
    notifyListeners();
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    _uiState = _uiState.copyWith(isRefreshing: false);
    notifyListeners();
  }
}
