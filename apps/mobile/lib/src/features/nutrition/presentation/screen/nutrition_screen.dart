import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/widgets/tnyx_weekly_calendar.dart';
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Title
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
              child: Text(
                'Nutrition',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
            ),

            // 2. Reusable Weekly Calendar
            TnyxWeeklyCalendar(
              weekDays: uiState.weekDays,
              selectedDate: uiState.selectedDate,
              onDateSelected: (date) => onAction(NutritionDateSelected(date)),
              allowFutureDates: false, // Future dates disabled as requested
            ),
            
            const Divider(height: 1, thickness: 0.5, color: Colors.white10),
            
            // Future content goes here...
            const Expanded(
              child: Center(child: Text('Nutrition Content Area')),
            ),
          ],
        ),
      ),
    );
  }
}
