import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/state/workout_ui_state.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/action/workout_action.dart';

class WorkoutViewModel extends ChangeNotifier {
  WorkoutViewModel() {
    final now = DateTime.now();
    _uiState = WorkoutUiState(
      selectedDate: now,
      weekDays: _generateWeekDays(now),
      // For testing, let's assume there is a plan. 
      // In a real app, this would come from a repository/use case.
      hasWorkoutPlan: true, 
    );
  }

  late WorkoutUiState _uiState;
  WorkoutUiState get uiState => _uiState;

  void onAction(WorkoutAction action) {
    switch (action) {
      case WorkoutArchiveClicked():
        _handleArchive();
        break;
      case WorkoutHistoryClicked():
        _handleHistory();
        break;
      case WorkoutDateSelected(date: final date):
        _selectDate(date);
        break;
    }
  }

  void _selectDate(DateTime date) {
    _uiState = _uiState.copyWith(selectedDate: date);
    // Here you would also check if the newly selected date has a workout plan
    // and update hasWorkoutPlan accordingly.
    notifyListeners();
  }

  void _handleArchive() {}
  void _handleHistory() {}

  List<DateTime> _generateWeekDays(DateTime date) {
    final int currentWeekday = date.weekday;
    final DateTime monday = date.subtract(Duration(days: currentWeekday - 1));
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }
}
