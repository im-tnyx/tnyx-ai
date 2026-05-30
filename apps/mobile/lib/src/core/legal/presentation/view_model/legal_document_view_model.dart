import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/core/config/app_config.dart';
import 'package:tnyx_mobile/src/core/language/app_language.dart';
import 'package:tnyx_mobile/src/core/language/app_localized_strings.dart';
import 'package:tnyx_mobile/src/core/legal/presentation/state/legal_document_ui_state.dart';
import 'package:tnyx_mobile/src/core/legal/presentation/action/legal_document_action.dart';

class LegalDocumentViewModel extends ChangeNotifier {
  LegalDocumentViewModel({
    required String title,
    required String url,
    required AppLanguage language,
  }) : _uiState = LegalDocumentUiState(
          title: title,
          url: url,
          strings: AppLocalizedStrings.from(language),
          isRemoteEnabled: AppConfig.remoteLegalDocsEnabled,
          isLoading: AppConfig.remoteLegalDocsEnabled,
        );

  LegalDocumentUiState _uiState;
  LegalDocumentUiState get uiState => _uiState;

  void onAction(LegalDocumentAction action) {
    switch (action) {
      case LegalDocumentWebPageStarted():
        _uiState = _uiState.copyWith(isLoading: true);
        notifyListeners();
        break;
      case LegalDocumentWebPageFinished():
        _uiState = _uiState.copyWith(isLoading: false);
        notifyListeners();
        break;
      case LegalDocumentCloseTapped():
      case LegalDocumentBackdropTapped():
        // Navigation handled in Route
        break;
    }
  }
}
