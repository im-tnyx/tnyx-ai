import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum HomeTabId { home, nutrition, ai, workout, progress }

@immutable
class HomeTabItem {
  const HomeTabItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.showLabel = true,
  });

  final HomeTabId id;
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final bool showLabel;
}

@immutable
class HomeUiState {
  const HomeUiState({
    required this.title,
    required this.headline,
    required this.description,
    required this.tabs,
    required this.selectedTab,
  });

  final String title;
  final String headline;
  final String description;
  final List<HomeTabItem> tabs;
  final HomeTabId selectedTab;

  HomeUiState copyWith({
    String? title,
    String? headline,
    String? description,
    List<HomeTabItem>? tabs,
    HomeTabId? selectedTab,
  }) {
    return HomeUiState(
      title: title ?? this.title,
      headline: headline ?? this.headline,
      description: description ?? this.description,
      tabs: tabs ?? this.tabs,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}

sealed class HomeAction {
  const HomeAction();
}

class HomeTabSelected extends HomeAction {
  const HomeTabSelected(this.tabId);

  final HomeTabId tabId;
}
