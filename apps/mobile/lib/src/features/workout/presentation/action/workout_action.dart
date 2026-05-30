sealed class WorkoutAction {
  const WorkoutAction();
}

class WorkoutArchiveClicked extends WorkoutAction {
  const WorkoutArchiveClicked();
}

class WorkoutHistoryClicked extends WorkoutAction {
  const WorkoutHistoryClicked();
}

class WorkoutDateSelected extends WorkoutAction {
  final DateTime date;
  const WorkoutDateSelected(this.date);
}
