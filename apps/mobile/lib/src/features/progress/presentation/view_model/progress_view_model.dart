import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/state/progress_ui_state.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/action/progress_action.dart';

class ProgressViewModel extends ChangeNotifier {
  ProgressUiState _uiState = const ProgressUiState();
  ProgressUiState get uiState => _uiState;

  void onAction(ProgressAction action) {
  }
}
