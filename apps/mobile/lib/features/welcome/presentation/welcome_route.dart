import 'package:flutter/material.dart';
import 'package:tnyx_mobile/core/legal/legal_document_sheet.dart';
import 'package:tnyx_mobile/core/language/app_localized_strings.dart';
import 'package:tnyx_mobile/core/language/language_scope.dart';
import 'package:tnyx_mobile/core/language/widgets/language_bottom_sheet.dart';
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
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        break;
      case WelcomeSignInClicked():
        // Sign-in route will be wired here.
        break;
      case WelcomeSkipForNowClicked():
        // Skip flow route will be wired here.
        break;
      case WelcomeLanguageClicked():
        _openLanguageSheet();
        break;
      case WelcomeTermsClicked():
        final strings = _viewModel.uiState.strings;
        showLegalDocumentSheet(
          context: context,
          type: LegalDocumentType.terms,
          termsUrl: strings.termsUrl,
          privacyUrl: strings.privacyUrl,
        );
        break;
      case WelcomePrivacyClicked():
        final strings = _viewModel.uiState.strings;
        showLegalDocumentSheet(
          context: context,
          type: LegalDocumentType.privacy,
          termsUrl: strings.termsUrl,
          privacyUrl: strings.privacyUrl,
        );
        break;
    }
  }

  Future<void> _openLanguageSheet() async {
    final manager = LanguageScope.read(context);
    final strings = AppLocalizedStrings.from(manager.currentLanguage);
    final selectedLanguage = await showLanguageBottomSheet(
      context: context,
      selectedLanguage: manager.currentLanguage,
      title: strings.selectLanguageTitle,
      subtitle: strings.selectLanguageSubtitle,
      searchHint: strings.searchLanguageHint,
      noResultsText: strings.noLanguageResultsText,
    );
    if (selectedLanguage == null) return;
    manager.setLanguage(selectedLanguage);
  }

  @override
  Widget build(BuildContext context) {
    final languageManager = LanguageScope.watch(context);
    final strings = AppLocalizedStrings.from(languageManager.currentLanguage);
    _viewModel.syncLocalizedStrings(strings);

    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return WelcomeScreen(
          uiState: _viewModel.uiState,
          onAction: _onAction,
        );
      },
    );
  }
}
