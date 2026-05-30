import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/state/nutrition_ui_state.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/action/nutrition_action.dart';

class NutritionViewModel extends ChangeNotifier {
  NutritionViewModel() {
    final now = DateTime.now();
    _uiState = NutritionUiState(
      selectedDate: now,
      weekDays: _generateWeekDays(now),
    );
  }

  late NutritionUiState _uiState;
  NutritionUiState get uiState => _uiState;

  void onAction(NutritionAction action) {
    switch (action) {
      case NutritionDateSelected(date: final date):
        _selectDate(date);
        break;
      case NutritionPreviousWeekRequested():
        _changeWeek(-7);
        break;
      case NutritionNextWeekRequested():
        _changeWeek(7);
        break;
    }
  }

  void _selectDate(DateTime date) {
    // भविष्य की तारीख को सेलेक्ट नहीं होने देना है
    if (date.isAfter(DateTime.now())) return;
    
    _uiState = _uiState.copyWith(selectedDate: date);
    notifyListeners();
  }

  void _changeWeek(int days) {
    final firstDayOfCurrentWeek = _uiState.weekDays.first;
    final newDate = firstDayOfCurrentWeek.add(Duration(days: days));
    
    // अगर अगले हफ़्ते का पहला दिन आज के बाद का है, तो आगे नहीं जाने देना है
    if (days > 0 && newDate.isAfter(DateTime.now())) return;

    _uiState = _uiState.copyWith(weekDays: _generateWeekDays(newDate));
    notifyListeners();
  }

  List<DateTime> _generateWeekDays(DateTime date) {
    // हफ़्ते का सोमवार (Monday) ढूँढना
    final int currentWeekday = date.weekday;
    final DateTime monday = date.subtract(Duration(days: currentWeekday - 1));
    
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }
}
