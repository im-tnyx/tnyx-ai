import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/widgets/tnyx_weekly_calendar.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/state/workout_ui_state.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/action/workout_action.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({
    required this.uiState,
    required this.onAction,
    super.key,
  });

  final WorkoutUiState uiState;
  final ValueChanged<WorkoutAction> onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Title + Action Icons
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Row(
                children: [
                  // Title
                  Text(
                    'Workouts',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),
                  const Spacer(),
                  // Archive/Drawer Icon
                  IconButton(
                    onPressed: () => onAction(const WorkoutArchiveClicked()),
                    icon: Icon(
                      Icons.inventory_2_outlined,
                      color: colors.onSurface,
                      size: 20,
                    ),
                  ),
                  // History/Clock Icon
                  IconButton(
                    onPressed: () => onAction(const WorkoutHistoryClicked()),
                    icon: Icon(
                      Icons.history_rounded,
                      color: colors.onSurface,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Top Divider: Only shown if there is NO workout plan
            if (!uiState.hasWorkoutPlan)
              const Divider(height: 1, thickness: 0.5, color: Colors.white10),

            // Date Section - Only shown if there's a workout plan
            if (uiState.hasWorkoutPlan) ...[
              TnyxWeeklyCalendar(
                weekDays: uiState.weekDays,
                selectedDate: uiState.selectedDate,
                onDateSelected: (date) => onAction(WorkoutDateSelected(date)),
                allowFutureDates: true, // Future plans are usually okay in workouts
              ),
              const Divider(height: 1, thickness: 0.5, color: Colors.white10),
            ],

            // Future Workout Content goes here...
            const Expanded(
              child: Center(
                child: Text(
                  'Workout Plans Area',
                  style: TextStyle(color: Colors.white38),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
