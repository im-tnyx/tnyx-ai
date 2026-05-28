import 'package:flutter/material.dart';
import 'package:tnyx_mobile/features/home/presentation/home_contract.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.uiState,
    required this.onAction,
    super.key,
  });

  final HomeUiState uiState;
  final ValueChanged<HomeAction> onAction;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final currentIndex = uiState.tabs.indexWhere((tab) => tab.id == uiState.selectedTab);

    return Scaffold(
      appBar: AppBar(
        title: Text(uiState.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                size: 56,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                uiState.headline,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                uiState.description,
                style: textTheme.bodyMedium?.copyWith(
                  color: textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        onTap: (index) => onAction(HomeTabSelected(uiState.tabs[index].id)),
        items: [
          for (final tab in uiState.tabs)
            BottomNavigationBarItem(
              icon: Icon(tab.icon),
              activeIcon: Icon(tab.activeIcon),
              label: tab.showLabel ? tab.label : '',
            ),
        ],
      ),
    );
  }
}
