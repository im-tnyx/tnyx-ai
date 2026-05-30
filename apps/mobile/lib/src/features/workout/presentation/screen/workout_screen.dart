import 'package:flutter/material.dart';
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
    return const Center(
      child: Text('Workout Screen'),
    );
  }
}
