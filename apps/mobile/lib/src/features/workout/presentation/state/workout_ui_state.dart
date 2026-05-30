import 'package:flutter/foundation.dart';

@immutable
class WorkoutUiState {
  const WorkoutUiState({
    required this.selectedDate,
    required this.weekDays,
    this.hasWorkoutPlan = false,
  });

  final DateTime selectedDate;
  final List<DateTime> weekDays;
  final bool hasWorkoutPlan;

  WorkoutUiState copyWith({
    DateTime? selectedDate,
    List<DateTime>? weekDays,
    bool? hasWorkoutPlan,
  }) {
    return WorkoutUiState(
      selectedDate: selectedDate ?? this.selectedDate,
      weekDays: weekDays ?? this.weekDays,
      hasWorkoutPlan: hasWorkoutPlan ?? this.hasWorkoutPlan,
    );
  }
}
