import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/state/progress_ui_state.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/action/progress_action.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    required this.uiState,
    required this.onAction,
    super.key,
  });

  final ProgressUiState uiState;
  final ValueChanged<ProgressAction> onAction;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Progress Screen'),
    );
  }
}
