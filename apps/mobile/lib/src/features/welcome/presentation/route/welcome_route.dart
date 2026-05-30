import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/config/app_config.dart';
import 'package:tnyx_mobile/src/core/legal/legal_document_sheet.dart';
import 'package:tnyx_mobile/src/core/navigation/app_router.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/action/welcome_action.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/screen/welcome_screen.dart';
import 'package:tnyx_mobile/src/features/welcome/presentation/view_model/welcome_view_model.dart';

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
        // Temporary navigation to Home until onboarding is ready
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        break;
      case WelcomeSignInClicked():
        // Temporary navigation to Home until sign-in is ready
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        break;
      case WelcomeSkipForNowClicked():
        // Skip flow directly to Home
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        break;
      case WelcomeLanguageChanged():
        // Language change is handled inside ViewModel
        break;
      case WelcomeTermsTapped():
        LegalDocumentSheet.show(
          context: context,
          title: _viewModel.uiState.termsText,
          url: '${AppConfig.legalBaseUrl}/terms-of-service',
          isRemoteEnabled: AppConfig.remoteLegalDocsEnabled,
        );
        break;
      case WelcomePrivacyTapped():
        LegalDocumentSheet.show(
          context: context,
          title: _viewModel.uiState.privacyText,
          url: '${AppConfig.legalBaseUrl}/privacy-policy',
          isRemoteEnabled: AppConfig.remoteLegalDocsEnabled,
        );
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
