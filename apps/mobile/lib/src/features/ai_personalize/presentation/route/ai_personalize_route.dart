import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/ai_personalize/presentation/action/ai_personalize_action.dart';
import 'package:tnyx_mobile/src/features/ai_personalize/presentation/screen/ai_personalize_screen.dart';
import 'package:tnyx_mobile/src/features/ai_personalize/presentation/view_model/ai_personalize_view_model.dart';

class AiPersonalizeRoute extends StatefulWidget {
  const AiPersonalizeRoute({super.key});

  // Custom static method for left-slide transition
  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AiPersonalizeRoute(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from RIGHT
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  State<AiPersonalizeRoute> createState() => _AiPersonalizeRouteState();
}

class _AiPersonalizeRouteState extends State<AiPersonalizeRoute> {
  late final AiPersonalizeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AiPersonalizeViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(AiPersonalizeAction action) {
    _viewModel.onAction(action);
    switch (action) {
      case AiPersonalizeBackClicked():
        Navigator.of(context).pop();
        break;
      case AiPersonalizeSaveClicked():
        // ViewModel handles logic, we might pop after success
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return AiPersonalizeScreen(
          uiState: _viewModel.uiState,
          onAction: _onAction,
        );
      },
    );
  }
}
