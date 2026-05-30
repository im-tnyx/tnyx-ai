import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/features/ai_personalize/presentation/state/ai_personalize_ui_state.dart';
import 'package:tnyx_mobile/src/features/ai_personalize/presentation/action/ai_personalize_action.dart';

class AiPersonalizeScreen extends StatelessWidget {
  const AiPersonalizeScreen({
    required this.uiState,
    required this.onAction,
    super.key,
  });

  final AiPersonalizeUiState uiState;
  final ValueChanged<AiPersonalizeAction> onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: TnyxDimens.elevationNone,
        scrolledUnderElevation: TnyxDimens.elevationNone,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colors.onSurface,
            size: TnyxDimens.iconSizeXS,
          ),
          onPressed: () => onAction(const AiPersonalizeBackClicked()),
        ),
        title: Text(
          'Personalize AI',
          style: textTheme.titleMedium?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: TnyxDimens.spaceXS),
            child: TextButton(
              onPressed: uiState.isLoading
                  ? null
                  : () => onAction(const AiPersonalizeSaveClicked()),
              child: uiState.isLoading
                  ? SizedBox(
                      width: TnyxDimens.iconSizeStreak,
                      height: TnyxDimens.iconSizeStreak,
                      child: CircularProgressIndicator(
                        strokeWidth: TnyxDimens.borderThick,
                        color: colors.onSurface,
                      ),
                    )
                  : Text(
                      'Save',
                      style: textTheme.labelLarge?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(color: colors.outlineVariant, height: 1),
          Expanded(
            child: Center(
              child: Text(
                'Personalization settings will appear here\n(Memory, Voice, Instructions, etc.)',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
