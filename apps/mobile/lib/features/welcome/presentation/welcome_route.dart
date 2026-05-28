import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/config/app_config.dart';
import 'package:tnyx_mobile/core/legal/legal_document_sheet.dart';
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
        // Next onboarding route will be wired here.
        break;
      case WelcomeSignInClicked():
        // Sign-in route will be wired here.
        break;
      case WelcomeSkipForNowClicked():
        // Skip flow route will be wired here.
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
