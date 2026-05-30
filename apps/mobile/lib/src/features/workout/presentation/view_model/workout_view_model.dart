import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/state/workout_ui_state.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/action/workout_action.dart';

class WorkoutViewModel extends ChangeNotifier {
  WorkoutUiState _uiState = const WorkoutUiState();
  WorkoutUiState get uiState => _uiState;

  void onAction(WorkoutAction action) {
    // Handle actions
  }
}
