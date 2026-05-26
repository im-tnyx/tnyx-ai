import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tnyx_mobile/features/home/presentation/home_contract.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel()
    : _uiState = HomeUiState(
        title: 'Tnyx',
        headline: 'Home dashboard ready',
        description:
            'Workout, nutrition aur progress flow bottom bar se access karein.',
        tabs: const [
          HomeTabItem(
            id: HomeTabId.home,
            label: 'Home',
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
          ),
          HomeTabItem(
            id: HomeTabId.nutrition,
            label: 'Nutrition',
            icon: Icons.restaurant_menu_outlined,
            activeIcon: Icons.restaurant_menu_rounded,
          ),
          HomeTabItem(
            id: HomeTabId.ai,
            label: '',
            icon: Icons.auto_awesome_outlined,
            activeIcon: Icons.auto_awesome_rounded,
            showLabel: false,
          ),
          HomeTabItem(
            id: HomeTabId.workout,
            label: 'Workout',
            icon: Icons.fitness_center_outlined,
            activeIcon: Icons.fitness_center_rounded,
          ),
          HomeTabItem(
            id: HomeTabId.progress,
            label: 'Progress',
            icon: Icons.show_chart_outlined,
            activeIcon: Icons.show_chart_rounded,
          ),
        ],
        selectedTab: HomeTabId.home,
      );

  HomeUiState _uiState;

  HomeUiState get uiState => _uiState;

  void onAction(HomeAction action) {
    switch (action) {
      case HomeTabSelected():
        _selectTab(action.tabId);
        return;
    }
  }

  void _selectTab(HomeTabId tabId) {
    if (_uiState.selectedTab == tabId) {
      return;
    }

    final tabContent = _contentForTab(tabId);
    _uiState = _uiState.copyWith(
      selectedTab: tabId,
      headline: tabContent.$1,
      description: tabContent.$2,
    );
    notifyListeners();
  }

  (String, String) _contentForTab(HomeTabId tabId) {
    switch (tabId) {
      case HomeTabId.home:
        return (
          'Home dashboard ready',
          'Workout, nutrition aur progress flow bottom bar se access karein.',
        );
      case HomeTabId.nutrition:
        return (
          'Nutrition logging',
          'Meals, calories aur macros ko fast log karne ke entry points.',
        );
      case HomeTabId.ai:
        return (
          'AI coach',
          'AI se workout, recovery aur habit guidance ke quick actions.',
        );
      case HomeTabId.workout:
        return (
          'Workout planner',
          'Training plans aur live session controls yahan se manage honge.',
        );
      case HomeTabId.progress:
        return (
          'Progress analytics',
          'Streaks, trends aur performance insights yahan show honge.',
        );
    }
  }
}
