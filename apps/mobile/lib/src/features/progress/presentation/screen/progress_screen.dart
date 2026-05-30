import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    // Alignment logic for 3 tabs
    double alignmentX = 0.0;
    if (uiState.selectedTab == ProgressTab.weight) {
      alignmentX = -1.0;
    } else if (uiState.selectedTab == ProgressTab.measures) {
      alignmentX = 0.0;
    } else {
      alignmentX = 1.0;
    }

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Title
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 12),
              child: Text(
                'Progress',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
            ),

            // 2. Custom Sliding Tab Switcher (3 Tabs)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: colors.onSurface.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
                ),
                child: Stack(
                  children: [
                    // Sliding Indicator
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutCubic,
                      alignment: Alignment(alignmentX, 0),
                      child: FractionallySizedBox(
                        widthFactor: 1 / 3,
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: colors.onSurface.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(TnyxDimens.radiusL - 2),
                            border: Border.all(
                              color: colors.onSurface.withOpacity(0.05),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Tab Buttons
                    Row(
                      children: [
                        _ProgressTabButton(
                          label: 'Weight',
                          icon: Icons.stacked_line_chart_rounded,
                          isSelected: uiState.selectedTab == ProgressTab.weight,
                          onTap: () => onAction(const ProgressTabSelected(ProgressTab.weight)),
                        ),
                        _ProgressTabButton(
                          label: 'Measures',
                          icon: Icons.straighten_rounded,
                          isSelected: uiState.selectedTab == ProgressTab.measures,
                          onTap: () => onAction(const ProgressTabSelected(ProgressTab.measures)),
                        ),
                        _ProgressTabButton(
                          label: 'Photos',
                          icon: Icons.collections_outlined,
                          isSelected: uiState.selectedTab == ProgressTab.photos,
                          onTap: () => onAction(const ProgressTabSelected(ProgressTab.photos)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Divider(height: 1, thickness: 0.5, color: Colors.white10),

            // 3. Content Area
            Expanded(
              child: Center(
                child: Text(
                  _getContentText(uiState.selectedTab),
                  style: const TextStyle(color: Colors.white38),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getContentText(ProgressTab tab) {
    switch (tab) {
      case ProgressTab.weight:
        return 'Weight Tracking Content';
      case ProgressTab.measures:
        return 'Body Measurements Content';
      case ProgressTab.photos:
        return 'Progress Photos Content';
    }
  }
}

class _ProgressTabButton extends StatelessWidget {
  const _ProgressTabButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? colors.onSurface : colors.onSurface.withOpacity(0.5),
                size: 18,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isSelected ? colors.onSurface : colors.onSurface.withOpacity(0.5),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
