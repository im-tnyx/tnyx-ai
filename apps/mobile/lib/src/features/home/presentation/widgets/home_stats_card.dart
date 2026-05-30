import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';

class HomeStatsCard extends StatelessWidget {
  const HomeStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceContainer, 
        borderRadius: BorderRadius.circular(TnyxDimens.radiusXL),
        border: Border.all(
          color: colors.onSurface.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Nutrition
            Expanded(
              child: _StatItem(
                icon: Icons.apple_outlined,
                label: 'Nutrition',
                value: '--',
                accentColor: colors.onSurface,
              ),
            ),
            
            _VerticalDivider(colors: colors),

            // Activity
            Expanded(
              child: _StatItem(
                icon: Icons.directions_run_rounded,
                label: 'Activity',
                value: '3',
                accentColor: colors.error,
                showProgressDot: true,
              ),
            ),

            _VerticalDivider(colors: colors),

            // Recovery
            Expanded(
              child: _StatItem(
                icon: Icons.nightlight_outlined,
                label: 'Recovery',
                value: '--',
                accentColor: colors.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.accentColor,
    this.showProgressDot = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color accentColor;
  final bool showProgressDot;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: accentColor),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: colors.onSurface.withValues(alpha: 0.9),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors.onSurface.withValues(alpha: 0.08),
                  width: 4,
                ),
              ),
            ),
            if (showProgressDot)
              Positioned(
                top: 0,
                child: Container(
                  width: 8,
                  height: 4,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            Text(
              value,
              style: TextStyle(
                color: colors.onSurface.withValues(alpha: value == '--' ? 0.3 : 1.0),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider({required this.colors});
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: colors.onSurface.withValues(alpha: 0.05),
    );
  }
}
