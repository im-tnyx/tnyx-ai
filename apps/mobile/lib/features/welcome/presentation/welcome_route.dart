import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/navigation/app_router.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_contract.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_screen.dart';
import 'package:tnyx_mobile/features/welcome/presentation/welcome_view_model.dart';

class WelcomeRoute extends StatefulWidget {
  const WelcomeRoute({super.key});

  @override
  State<WelcomeRoute> createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute> {
  late final WelcomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = WelcomeViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(WelcomeAction action) {
    _viewModel.onAction(action);
    switch (action) {
      case WelcomeGetStartedClicked():
        Navigator.of(context).pushReplacementNamed(AppRoutes.tempHome);
        break;
      case WelcomeSignInClicked():
        // Sign-in route will be wired here.
        break;
      case WelcomeSkipForNowClicked():
        // Skip flow route will be wired here.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return WelcomeScreen(
          state: _viewModel.uiState,
          onAction: _onAction,
        );
      },
    );
  }
}
