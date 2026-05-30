import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/state/nutrition_ui_state.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/action/nutrition_action.dart';

class NutritionViewModel extends ChangeNotifier {
  NutritionUiState _uiState = const NutritionUiState();
  NutritionUiState get uiState => _uiState;

  void onAction(NutritionAction action) {
    // Handle actions
  }
}
