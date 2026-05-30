import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

class TnyxTabItem<T> {
  final String label;
  final IconData icon;
  final T value;

  const TnyxTabItem({
    required this.label,
    required this.icon,
    required this.value,
  });
}

class TnyxSlidingTabSwitcher<T> extends StatelessWidget {
  const TnyxSlidingTabSwitcher({
    required this.tabs,
    required this.selectedValue,
    required this.onTabSelected,
    this.height = 50,
    super.key,
  });

  final List<TnyxTabItem<T>> tabs;
  final T selectedValue;
  final ValueChanged<T> onTabSelected;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final selectedIndex = tabs.indexWhere((tab) => tab.value == selectedValue);
    
    // Calculate alignment: maps index to range [-1.0, 1.0]
    double alignmentX = 0.0;
    if (tabs.length > 1) {
      alignmentX = -1.0 + (selectedIndex / (tabs.length - 1)) * 2.0;
    }

    return Container(
      height: height,
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
              widthFactor: 1 / tabs.length,
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
            children: tabs.map((tab) {
              final isSelected = tab.value == selectedValue;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTabSelected(tab.value),
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          tab.icon,
                          color: isSelected ? colors.onSurface : colors.onSurface.withOpacity(0.5),
                          size: tabs.length > 2 ? 18 : 20,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            tab.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: isSelected ? colors.onSurface : colors.onSurface.withOpacity(0.5),
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              fontSize: tabs.length > 2 ? 13 : 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
