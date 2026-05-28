import 'package:flutter/material.dart';
import 'package:tnyx_mobile/features/home/presentation/home_contract.dart';
import 'package:tnyx_mobile/features/home/presentation/home_screen.dart';
import 'package:tnyx_mobile/features/home/presentation/home_view_model.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(HomeAction action) {
    _viewModel.onAction(action);
    switch (action) {
      case HomeTabSelected():
        return;
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
        );
      },
    );
  }
}
