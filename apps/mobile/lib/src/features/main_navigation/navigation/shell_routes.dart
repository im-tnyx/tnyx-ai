import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/action/shell_action.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/state/shell_ui_state.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/screen/main_shell.dart';
import 'package:tnyx_mobile/src/features/main_navigation/presentation/view_model/shell_view_model.dart';
import 'package:tnyx_mobile/src/features/home/presentation/route/home_route.dart';
import 'package:tnyx_mobile/src/features/nutrition/presentation/route/nutrition_route.dart';
import 'package:tnyx_mobile/src/features/workout/presentation/route/workout_route.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/route/ai_route.dart';
import 'package:tnyx_mobile/src/features/progress/presentation/route/progress_route.dart';

class MainShellRoute extends StatefulWidget {
  const MainShellRoute({super.key});

  @override
  State<MainShellRoute> createState() => _MainShellRouteState();
}

class _MainShellRouteState extends State<MainShellRoute> {
  late final ShellViewModel _viewModel;
  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _viewModel = ShellViewModel();
    
    _tabs = [
      HomeRoute(
        onScroll: (offset) => _onAction(ShellScrollChanged(offset)),
      ),
      const NutritionRoute(),
      AiRoute(
        onBack: () => _onAction(const ShellTabSelected(ShellTab.home)),
        onRecentChat: () {
          // Logic for showing recent chats is handled internally in AiScreen's Scaffold Drawer
        },
        onModelSelection: () {
          // Logic for model selection is handled internally in AiScreen's bottom sheet
        },
      ),
      const WorkoutRoute(),
      const ProgressRoute(),
    ];
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(ShellAction action) {
    _viewModel.onAction(action);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return MainShell(
          uiState: _viewModel.uiState,
          onAction: _onAction,
          tabs: _tabs,
        );
      },
    );
  }
}
