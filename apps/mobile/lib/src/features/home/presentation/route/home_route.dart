import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/home/presentation/action/home_action.dart';
import 'package:tnyx_mobile/src/features/home/presentation/screen/home_screen.dart';
import 'package:tnyx_mobile/src/features/home/presentation/view_model/home_view_model.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({
    required this.onScroll,
    super.key,
  });

  final ValueChanged<double> onScroll;

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  late final HomeViewModel _viewModel;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  void _onScroll() {
    widget.onScroll(_scrollController.offset);
  }

  void _onAction(HomeAction action) {
    _viewModel.onAction(action);
    switch (action) {
      case HomeRefreshRequested():
        break;
      case HomeInternalAction():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return HomeScreen(
          uiState: _viewModel.uiState,
          onAction: _onAction,
          scrollController: _scrollController,
        );
      },
    );
  }
}
