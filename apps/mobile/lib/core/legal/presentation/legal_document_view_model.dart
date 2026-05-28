import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/core/legal/presentation/legal_document_contract.dart';

class LegalDocumentViewModel extends ChangeNotifier {
  LegalDocumentViewModel({
    required String title,
    required String documentUrl,
    required bool isRemoteEnabled,
  }) : _uiState = LegalDocumentUiState(
          title: title,
          documentUrl: documentUrl,
          isRemoteEnabled: isRemoteEnabled,
          isLoading: isRemoteEnabled,
        );

  LegalDocumentUiState _uiState;

  LegalDocumentUiState get uiState => _uiState;

  void onAction(LegalDocumentAction action) {
    switch (action) {
      case LegalDocumentWebPageStarted():
        _setLoading(true);
        return;
      case LegalDocumentWebPageFinished():
        _setLoading(false);
        return;
      case LegalDocumentCloseTapped():
      case LegalDocumentBackdropTapped():
        return;
    }
  }

  void _setLoading(bool isLoading) {
    if (_uiState.isLoading == isLoading) return;
    _uiState = _uiState.copyWith(isLoading: isLoading);
    notifyListeners();
  }
}
