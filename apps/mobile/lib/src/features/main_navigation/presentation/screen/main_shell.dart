import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/state/shell_ui_state.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/action/shell_action.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/widgets/main_bottom_nav.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/widgets/main_top_bar.dart';

class MainShell extends StatelessWidget {
  const MainShell({
    required this.uiState,
    required this.onAction,
    required this.tabs,
    super.key,
  });

  final ShellUiState uiState;
  final ValueChanged<ShellAction> onAction;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final showTopBar = uiState.selectedTab == ShellTab.home;

    return Scaffold(
      extendBody: true,
      backgroundColor: colors.surface,
      // AppBar हटा दिया गया है ताकि हम Stack का उपयोग कर सकें
      body: Stack(
        children: [
          // Main Content
          IndexedStack(
            index: uiState.selectedTab.index,
            children: tabs,
          ),

          // Floating Top Bar with Gradient reaching the edge
          if (showTopBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MainTopBar(
                onAction: onAction,
                scrollOpacity: uiState.appBarOpacity,
              ),
            ),
        ],
      ),
      bottomNavigationBar: MainBottomNav(
        selectedTab: uiState.selectedTab,
        onAction: onAction,
      ),
    );
  }
}
