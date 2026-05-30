import 'package:flutter/foundation.dart';

@immutable
class HomeUiState {
  const HomeUiState({
    this.isRefreshing = false,
    this.caloriesTarget = 3400,
    this.caloriesConsumed = 0,
    this.exerciseCalories = 0,
    this.proteinTarget = 111,
    this.proteinConsumed = 29,
    this.carbsTarget = 278,
    this.carbsConsumed = 61,
    this.fatTarget = 75,
    this.fatConsumed = 31,
  });

  final bool isRefreshing;
  
  // Calories
  final int caloriesTarget;
  final int caloriesConsumed;
  final int exerciseCalories;
  int get caloriesRemaining => caloriesTarget - caloriesConsumed + exerciseCalories;

  // Macros
  final int proteinTarget;
  final int proteinConsumed;
  final int carbsTarget;
  final int carbsConsumed;
  final int fatTarget;
  final int fatConsumed;

  HomeUiState copyWith({
    bool? isRefreshing,
    int? caloriesTarget,
    int? caloriesConsumed,
    int? exerciseCalories,
    int? proteinTarget,
    int? proteinConsumed,
    int? carbsTarget,
    int? carbsConsumed,
    int? fatTarget,
    int? fatConsumed,
  }) {
    return HomeUiState(
      isRefreshing: isRefreshing ?? this.isRefreshing,
      caloriesTarget: caloriesTarget ?? this.caloriesTarget,
      caloriesConsumed: caloriesConsumed ?? this.caloriesConsumed,
      exerciseCalories: exerciseCalories ?? this.exerciseCalories,
      proteinTarget: proteinTarget ?? this.proteinTarget,
      proteinConsumed: proteinConsumed ?? this.proteinConsumed,
      carbsTarget: carbsTarget ?? this.carbsTarget,
      carbsConsumed: carbsConsumed ?? this.carbsConsumed,
      fatTarget: fatTarget ?? this.fatTarget,
      fatConsumed: fatConsumed ?? this.fatConsumed,
    );
  }
}
