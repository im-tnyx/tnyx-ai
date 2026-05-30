import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/state/ai_ui_state.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/action/ai_action.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({
    required this.uiState,
    required this.onAction,
    super.key,
  });

  final AiUiState uiState;
  final ValueChanged<AiAction> onAction;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('AI Center Screen'),
    );
  }
}
