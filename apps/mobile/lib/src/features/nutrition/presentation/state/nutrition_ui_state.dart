import 'package:flutter/foundation.dart';

@immutable
class NutritionUiState {
  const NutritionUiState({
    required this.selectedDate,
    required this.weekDays,
  });

  final DateTime selectedDate;
  final List<DateTime> weekDays;

  NutritionUiState copyWith({
    DateTime? selectedDate,
    List<DateTime>? weekDays,
  }) {
    return NutritionUiState(
      selectedDate: selectedDate ?? this.selectedDate,
      weekDays: weekDays ?? this.weekDays,
    );
  }
}
