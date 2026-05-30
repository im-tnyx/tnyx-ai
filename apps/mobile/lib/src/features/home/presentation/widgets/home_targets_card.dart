import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

class HomeTargetsCard extends StatelessWidget {
  const HomeTargetsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(TnyxDimens.paddingScreen),
      decoration: BoxDecoration(
        // Proper elevation on top of AMOLED black
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(TnyxDimens.radiusXL),
        border: Border.all(
          color: colors.onSurface.withOpacity(isDark ? 0.08 : 0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Title and Score
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Targets",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: colors.onSurface.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '0',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                      TextSpan(
                        text: '/7',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colors.onSurface.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TnyxDimens.spaceS),
          
          // Targets Row - Centered and evenly spaced for all screen sizes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const _TargetIcon(icon: Icons.app_registration_rounded),
              const _TargetIcon(icon: Icons.apple_rounded),
              const _TargetIcon(icon: Icons.egg_outlined),
              const _TargetIcon(icon: Icons.directions_walk_rounded),
              const _TargetIcon(icon: Icons.water_drop_outlined),
              _TargetIcon(
                icon: Icons.assignment_turned_in_outlined,
                badge: 'x 2',
                badgeColor: Colors.purple.shade300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TargetIcon extends StatelessWidget {
  const _TargetIcon({
    required this.icon,
    this.badge,
    this.badgeColor,
  });

  final IconData icon;
  final String? badge;
  final Color? badgeColor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.onSurface.withOpacity(0.03),
            border: Border.all(
              color: colors.onSurface.withOpacity(0.08),
            ),
          ),
          child: Icon(
            icon,
            size: 20,
            color: colors.onSurface.withOpacity(0.8),
          ),
        ),
        if (badge != null)
          Positioned(
            top: -8,
            right: -8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: badgeColor ?? Colors.purple,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: (badgeColor ?? Colors.purple).withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Text(
                badge!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
