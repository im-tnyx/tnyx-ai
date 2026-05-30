import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/action/ai_action.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/screen/ai_screen.dart';
import 'package:tnyx_mobile/src/features/ai/presentation/view_model/ai_view_model.dart';

import 'package:tnyx_mobile/src/features/ai_personalize/presentation/route/ai_personalize_route.dart';

class AiRoute extends StatefulWidget {
  const AiRoute({
    required this.onBack,
    required this.onRecentChat,
    required this.onModelSelection,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onRecentChat;
  final VoidCallback onModelSelection;

  @override
  State<AiRoute> createState() => _AiRouteState();
}

class _AiRouteState extends State<AiRoute> {
  late final AiViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AiViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onAction(AiAction action) {
    _viewModel.onAction(action);
    switch (action) {
      case AiBackClicked():
        widget.onBack();
        break;
      case AiRecentChatClicked():
        widget.onRecentChat();
        break;
      case AiModelSelectionClicked():
        widget.onModelSelection();
        break;
      case AiPersonalizeClicked():
        Navigator.of(context).push(AiPersonalizeRoute.route());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return AiScreen(
          uiState: _viewModel.uiState,
          onAction: _onAction,
        );
      },
    );
  }
}
