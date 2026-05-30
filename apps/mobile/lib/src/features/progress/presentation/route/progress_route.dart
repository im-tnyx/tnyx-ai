import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/action/progress_action.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/screen/progress_screen.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/view_model/progress_view_model.dart';

class ProgressRoute extends StatefulWidget {
  const ProgressRoute({super.key});

  @override
  State<ProgressRoute> createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute> {
  late final ProgressViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ProgressViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(ProgressAction action) {
    _viewModel.onAction(action);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return ProgressScreen(
          uiState: _viewModel.uiState,
          onAction: _onAction,
        );
      },
    );
  }
}
