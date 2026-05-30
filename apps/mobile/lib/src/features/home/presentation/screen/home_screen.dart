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
    
    // Using primaryContainer which is mapped to our Premium Blue in dark mode
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
                    color: colors.outline.withValues(alpha: isDark ? 0.05 : 0.1),
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
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: HomeStatsCard(),
                  ),
                ],
              ),
            ),
          ),

          // 2. Main Activity Feed
          SliverPadding(
            padding: const EdgeInsets.all(TnyxDimens.paddingScreen),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: TnyxDimens.spaceS),
                      child: HomeTargetsCard(),
                    );
                  }
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
        color: colors.surfaceContainer.withValues(alpha: isDark ? 0.4 : 0.6),
        borderRadius: BorderRadius.circular(TnyxDimens.radiusL),
        border: Border.all(color: colors.outline.withValues(alpha: 0.05)),
      ),
    );
  }
}
