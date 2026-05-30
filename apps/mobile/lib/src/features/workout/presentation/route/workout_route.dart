import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/action/workout_action.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/screen/workout_screen.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/view_model/workout_view_model.dart';

class WorkoutRoute extends StatefulWidget {
  const WorkoutRoute({super.key});

  @override
  State<WorkoutRoute> createState() => _WorkoutRouteState();
}

class _WorkoutRouteState extends State<WorkoutRoute> {
  late final WorkoutViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = WorkoutViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(WorkoutAction action) {
    _viewModel.onAction(action);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return WorkoutScreen(
          uiState: _viewModel.uiState,
          onAction: _onAction,
        );
      },
    );
  }
}
