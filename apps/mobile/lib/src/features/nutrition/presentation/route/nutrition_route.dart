import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/action/nutrition_action.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/screen/nutrition_screen.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/view_model/nutrition_view_model.dart';

class NutritionRoute extends StatefulWidget {
  const NutritionRoute({super.key});

  @override
  State<NutritionRoute> createState() => _NutritionRouteState();
}

class _NutritionRouteState extends State<NutritionRoute> {
  late final NutritionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = NutritionViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(NutritionAction action) {
    _viewModel.onAction(action);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return NutritionScreen(
          uiState: _viewModel.uiState,
          onAction: _onAction,
        );
      },
    );
  }
}
