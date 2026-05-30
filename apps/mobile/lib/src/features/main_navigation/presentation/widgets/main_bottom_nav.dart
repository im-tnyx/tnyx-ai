import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_colors.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/state/shell_ui_state.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/action/shell_action.dart';
import 'package:tnyx_mobile/src/features/home/presentation/widgets/tnyx_particle.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    required this.selectedTab,
    required this.onAction,
    super.key,
  });

  final ShellTab selectedTab;
  final ValueChanged<ShellAction> onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final isDark = theme.brightness == Brightness.dark;

    // Premium Glass Effect: Color with Alpha based on theme
    final navBackground = isDark
        ? TnyxColors.bottomNavBackground.withOpacity(0.65)
        : colors.surfaceContainer.withOpacity(0.8);

    return Container(
      margin: EdgeInsets.fromLTRB(
        TnyxDimens.bottomNavMarginHorizontal,
        0,
        TnyxDimens.bottomNavMarginHorizontal,
        (bottomPadding > 0 ? bottomPadding : TnyxDimens.bottomNavMarginBottom),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TnyxDimens.radiusPill),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(TnyxDimens.opacitySubtle),
            blurRadius: TnyxDimens.bottomNavShadowBlur,
            offset: const Offset(0, TnyxDimens.bottomNavShadowOffsetY),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(TnyxDimens.radiusPill),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: TnyxDimens.bottomNavPadding,
              vertical: TnyxDimens.bottomNavPadding,
            ),
            decoration: BoxDecoration(
              color: navBackground,
              borderRadius: BorderRadius.circular(TnyxDimens.radiusPill),
              border: Border.all(
                color: colors.onSurface.withOpacity(isDark ? 0.08 : 0.12),
                width: 1,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final tabWidth = constraints.maxWidth / 5;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Sliding Background Highlight
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutCubic,
                      left: selectedTab.index * tabWidth,
                      top: 0,
                      bottom: 0,
                      width: tabWidth,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: selectedTab == ShellTab.ai ? 0.0 : 1.0,
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: colors.onSurface.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(TnyxDimens.radiusBottomNavSelection),
                          ),
                        ),
                      ),
                    ),

                    // Navigation Content
                    Row(
                      children: [
                        _NavIcon(
                          icon: Icons.home_rounded,
                          label: 'Home',
                          isSelected: selectedTab == ShellTab.home,
                          onTap: () => onAction(const ShellTabSelected(ShellTab.home)),
                        ),
                        _NavIcon(
                          icon: Icons.restaurant_menu_rounded,
                          label: 'Nutrition',
                          isSelected: selectedTab == ShellTab.nutrition,
                          onTap: () => onAction(const ShellTabSelected(ShellTab.nutrition)),
                        ),

                        // AI Center Button
                        Expanded(
                          child: TnyxParticle(
                            onClick: () => onAction(const ShellTabSelected(ShellTab.ai)),
                          ),
                        ),

                        _NavIcon(
                          icon: Icons.fitness_center_rounded,
                          label: 'Workout',
                          isSelected: selectedTab == ShellTab.workout,
                          onTap: () => onAction(const ShellTabSelected(ShellTab.workout)),
                        ),
                        _NavIcon(
                          icon: Icons.show_chart_rounded,
                          label: 'Progress',
                          isSelected: selectedTab == ShellTab.progress,
                          onTap: () => onAction(const ShellTabSelected(ShellTab.progress)),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
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
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? colors.onSurface : colors.onSurface.withOpacity(0.5),
                size: TnyxDimens.bottomBarIcon,
              ),
              const SizedBox(height: 1),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? colors.onSurface : colors.onSurface.withOpacity(0.5),
                  fontSize: TnyxDimens.bottomNavLabelFontSize,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
