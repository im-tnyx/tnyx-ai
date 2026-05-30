sealed class NutritionAction {
  const NutritionAction();
}

class NutritionDateSelected extends NutritionAction {
  final DateTime date;
  const NutritionDateSelected(this.date);
}

class NutritionPreviousWeekRequested extends NutritionAction {
  const NutritionPreviousWeekRequested();
}

class NutritionNextWeekRequested extends NutritionAction {
  const NutritionNextWeekRequested();
}
