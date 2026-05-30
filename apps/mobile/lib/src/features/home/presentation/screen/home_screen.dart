import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/features/home/presentation/state/home_ui_state.dart';
import 'package:tnyx_mobile/src/features/home/presentation/action/home_action.dart';
import 'package:tnyx_mobile/src/features/home/presentation/widgets/home_stats_card.dart';
import 'package:tnyx_mobile/src/features/home/presentation/widgets/home_targets_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.uiState,
    required this.onAction,
    required this.scrollController,
    super.key,
  });

  final HomeUiState uiState;
  final ValueChanged<HomeAction> onAction;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    
    // Using primaryContainer which is mapped to our brand blue/fallback
    final heroBackground = colors.primaryContainer;

    return RefreshIndicator(
      onRefresh: () async {
        onAction(const HomeRefreshRequested());
        while (uiState.isRefreshing) {
          await Future.delayed(const Duration(milliseconds: 100));
        }
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // 1. Premium TNYX Hero Header
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: heroBackground, 
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(TnyxDimens.radiusXL),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: colors.outline.withOpacity(isDark ? 0.05 : 0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  // Space for the fixed TopBar (managed by Shell)
                  SizedBox(height: MediaQuery.paddingOf(context).top + TnyxDimens.topBarHeight),

                  // Main Dash Stats Card
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: HomeStatsCard(),
                  ),

                  // Today's Targets Card moved inside the Hero Header "box"
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: HomeTargetsCard(),
                  ),
                ],
              ),
            ),
          ),

          // 2. Nutrition Stats Pager
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: _HomeNutritionPager(uiState: uiState),
            ),
          ),

          // 3. Main Activity Feed
          SliverPadding(
            padding: const EdgeInsets.all(TnyxDimens.paddingScreen),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _ActivityCard(colors: colors);
                },
                childCount: 8,
              ),
            ),
          ),
          
          const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
        ],
      ),
    );
  }
}

class _HomeNutritionPager extends StatefulWidget {
  const _HomeNutritionPager({required this.uiState});
  final HomeUiState uiState;

  @override
  State<_HomeNutritionPager> createState() => _HomeNutritionPagerState();
}

class _HomeNutritionPagerState extends State<_HomeNutritionPager> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            children: [
              _CaloriesPagerCard(uiState: widget.uiState),
              _MacrosPagerCard(uiState: widget.uiState),
              const _VitaminsPagerCard(),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 4,
              width: _currentPage == index ? 16 : 4,
              decoration: BoxDecoration(
                color: _currentPage == index 
                    ? Theme.of(context).colorScheme.primary 
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _CaloriesPagerCard extends StatelessWidget {
  const _CaloriesPagerCard({required this.uiState});
  final HomeUiState uiState;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final progress = uiState.caloriesTarget > 0 
        ? (uiState.caloriesConsumed / uiState.caloriesTarget).clamp(0.0, 1.0)
        : 0.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // Use surfaceContainer for elevation look
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(TnyxDimens.radiusXL),
        // Adding a crisp border and subtle shadow to make it "pop"
        border: Border.all(
          color: colors.onSurface.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calories',
            style: textTheme.titleLarge?.copyWith(color: colors.onSurface, fontWeight: FontWeight.bold),
          ),
          Text(
            'Remaining = Goal - Food + Exercise',
            style: textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant),
          ),
          const Spacer(),
          Row(
            children: [
              // Circular Progress
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      backgroundColor: colors.onSurface.withOpacity(0.05),
                      valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        uiState.caloriesRemaining.toString(),
                        style: textTheme.titleMedium?.copyWith(color: colors.onSurface, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Remaining',
                        style: textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 32),
              // Stats
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CalorieStatRow(
                    icon: Icons.flag_rounded,
                    label: 'Base Goal',
                    value: uiState.caloriesTarget.toString(),
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: 12),
                  _CalorieStatRow(
                    icon: Icons.restaurant_rounded,
                    label: 'Food',
                    value: uiState.caloriesConsumed.toString(),
                    color: colors.primary,
                  ),
                  const SizedBox(height: 12),
                  _CalorieStatRow(
                    icon: Icons.local_fire_department_rounded,
                    label: 'Exercise',
                    value: uiState.exerciseCalories.toString(),
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _CalorieStatRow extends StatelessWidget {
  const _CalorieStatRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant, fontSize: 10)),
            Text(value, style: textTheme.bodyMedium?.copyWith(color: colors.onSurface, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

class _MacrosPagerCard extends StatelessWidget {
  const _MacrosPagerCard({required this.uiState});
  final HomeUiState uiState;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(TnyxDimens.radiusXL),
        border: Border.all(
          color: colors.onSurface.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Macros',
            style: textTheme.titleLarge?.copyWith(color: colors.onSurface, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NutritionCircle(
                label: 'Carbs',
                current: uiState.carbsConsumed,
                target: uiState.carbsTarget,
                unit: 'g',
                color: const Color(0xFF55B4A6),
              ),
              _NutritionCircle(
                label: 'Fat',
                current: uiState.fatConsumed,
                target: uiState.fatTarget,
                unit: 'g',
                color: Colors.deepPurple,
              ),
              _NutritionCircle(
                label: 'Protein',
                current: uiState.proteinConsumed,
                target: uiState.proteinTarget,
                unit: 'g',
                color: Colors.orangeAccent,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _VitaminsPagerCard extends StatelessWidget {
  const _VitaminsPagerCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(TnyxDimens.radiusXL),
        border: Border.all(
          color: colors.onSurface.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vitamins & Minerals',
            style: textTheme.titleLarge?.copyWith(color: colors.onSurface, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const _NutritionCircle(
                label: 'Vitamins',
                current: 65,
                target: 100,
                unit: '%',
                color: Color(0xFFF87171),
              ),
              const _NutritionCircle(
                label: 'Minerals',
                current: 42,
                target: 100,
                unit: '%',
                color: Color(0xFF60A5FA),
              ),
              const _NutritionCircle(
                label: 'Others',
                current: 18,
                target: 100,
                unit: '%',
                color: Color(0xFF34D399),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _NutritionCircle extends StatelessWidget {
  const _NutritionCircle({
    required this.label,
    required this.current,
    required this.target,
    required this.unit,
    required this.color,
  });
  final String label;
  final int current;
  final int target;
  final String unit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final progress = target > 0 ? (current / target).clamp(0.0, 1.0) : 0.0;

    return Column(
      children: [
        Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 6,
                backgroundColor: colors.onSurface.withOpacity(0.05),
                valueColor: AlwaysStoppedAnimation<Color>(color),
                strokeCap: StrokeCap.round,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  current.toString(), 
                  style: textTheme.bodyMedium?.copyWith(color: colors.onSurface, fontWeight: FontWeight.bold)
                ),
                Text(
                  unit == '%' ? '%' : '/$target$unit', 
                  style: textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant, fontSize: 9)
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        if (unit != '%')
          Text('${target - current}$unit left', style: textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant, fontSize: 10))
        else
          Text('${(progress * 100).toInt()}% Goal', style: textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant, fontSize: 10)),
      ],
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({required this.colors});
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(bottom: TnyxDimens.spaceS),
      decoration: BoxDecoration(
        color: colors.surfaceContainer.withOpacity(isDark ? 0.4 : 0.6),
        borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
        border: Border.all(color: colors.outline.withOpacity(0.05)),
      ),
    );
  }
}
