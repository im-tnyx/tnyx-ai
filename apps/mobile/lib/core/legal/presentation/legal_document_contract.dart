import 'package:flutter/foundation.dart';

enum LegalDocumentType {
  terms,
  privacy,
}

@immutable
class LegalDocumentUiState {
  const LegalDocumentUiState({
    required this.title,
    required this.documentUrl,
    required this.isRemoteEnabled,
    required this.isLoading,
  });

  final String title;
  final String documentUrl;
  final bool isRemoteEnabled;
  final bool isLoading;

  LegalDocumentUiState copyWith({
    String? title,
    String? documentUrl,
    bool? isRemoteEnabled,
    bool? isLoading,
  }) {
    return LegalDocumentUiState(
      title: title ?? this.title,
      documentUrl: documentUrl ?? this.documentUrl,
      isRemoteEnabled: isRemoteEnabled ?? this.isRemoteEnabled,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

sealed class LegalDocumentAction {
  const LegalDocumentAction();
}

class LegalDocumentWebPageStarted extends LegalDocumentAction {
  const LegalDocumentWebPageStarted();
}

class LegalDocumentWebPageFinished extends LegalDocumentAction {
  const LegalDocumentWebPageFinished();
}

class LegalDocumentCloseTapped extends LegalDocumentAction {
  const LegalDocumentCloseTapped();
}

class LegalDocumentBackdropTapped extends LegalDocumentAction {
  const LegalDocumentBackdropTapped();
}
