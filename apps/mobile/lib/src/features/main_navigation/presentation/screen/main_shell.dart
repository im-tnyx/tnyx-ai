import 'package:flutter/material.dart';
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
    // AI स्क्रीन पर नेविगेशन बार छिपाने के लिए
    final showBottomNav = uiState.selectedTab != ShellTab.ai;

    return Scaffold(
      extendBody: true,
      backgroundColor: colors.surface,
      body: Stack(
        children: [
          // Main Content
          IndexedStack(
            index: uiState.selectedTab.index,
            children: tabs,
          ),

          // Floating Top Bar
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
      // सशर्त रूप से बॉटम नेव रेंडर करना
      bottomNavigationBar: showBottomNav 
          ? MainBottomNav(
              selectedTab: uiState.selectedTab,
              onAction: onAction,
            )
          : null,
    );
  }
}
