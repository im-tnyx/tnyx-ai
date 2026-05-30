import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_typography.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/action/shell_action.dart';

class MainTopBar extends StatelessWidget {
  const MainTopBar({
    required this.onAction,
    this.scrollOpacity = 0.0,
    super.key,
  });

  final ValueChanged<ShellAction> onAction;
  final double scrollOpacity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final topPadding = MediaQuery.paddingOf(context).top;
    
    // Starting color (Premium Blue from Theme)
    final blueColor = colors.primaryContainer; 
    // Target color (AMOLED Black from Theme)
    final blackColor = colors.surface;

    // Smoothly transition between Blue and Black based on scroll
    final themeColor = Color.lerp(blueColor, blackColor, scrollOpacity) ?? blueColor;

    return Container(
      height: TnyxDimens.topBarHeight + topPadding,
      // [TAG: TOP BAR DYNAMIC GRADIENT] 
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            themeColor.withValues(alpha: 1.0),
            themeColor.withValues(alpha: 0.95),
            themeColor.withValues(alpha: 0.0),
          ],
          stops: const [
            0.0,
            0.60,
            1.0,
          ],
        ),
      ),
      padding: EdgeInsets.only(
        top: topPadding,
        left: TnyxDimens.topBarPaddingHorizontal,
        right: TnyxDimens.topBarPaddingHorizontal,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Left: TNYX
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'TNYX',
              style: TnyxTypography.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: colors.onSurface,
              ),
            ),
          ),

          // Center: Get Premium
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => onAction(const ShellPremiumClicked()),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: TnyxDimens.spaceS, 
                  vertical: TnyxDimens.spaceXXS,
                ),
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(TnyxDimens.radiusPremiumBox),
                  border: Border.all(
                    color: colors.primary.withValues(alpha: 0.3),
                    width: TnyxDimens.borderThin,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: TnyxDimens.iconSizePremium,
                      color: colors.primary,
                    ),
                    const SizedBox(width: TnyxDimens.spaceXXS),
                    Text(
                      'Get Premium',
                      style: TnyxTypography.textTheme.labelLarge?.copyWith(
                        fontSize: 12,
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right: Icons with Outer Rings
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => onAction(const ShellStreakClicked()),
                  child: Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colors.onSurface.withValues(alpha: 0.2),
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: TnyxDimens.topBarItemSize - 5,
                      height: TnyxDimens.topBarItemSize - 5,
                      decoration: BoxDecoration(
                        color: colors.onSurface.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.local_fire_department_rounded,
                        size: 18,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: TnyxDimens.spaceS),
                GestureDetector(
                  onTap: () => onAction(const ShellProfileClicked()),
                  child: Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colors.onSurface.withValues(alpha: 0.2),
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: TnyxDimens.topBarItemSize - 5,
                      height: TnyxDimens.topBarItemSize - 5,
                      decoration: BoxDecoration(
                        color: colors.onSurface.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 20,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
