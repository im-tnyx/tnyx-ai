import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/state/nutrition_ui_state.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/action/nutrition_action.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({
    required this.uiState,
    required this.onAction,
    super.key,
  });

  final NutritionUiState uiState;
  final ValueChanged<NutritionAction> onAction;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Nutrition Screen'),
    );
  }
}
