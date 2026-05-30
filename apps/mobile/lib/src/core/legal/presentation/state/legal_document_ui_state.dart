import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/core/language/app_localized_strings.dart';

@immutable
class LegalDocumentUiState {
  const LegalDocumentUiState({
    required this.title,
    required this.url,
    required this.strings,
    this.isLoading = true,
    this.isRemoteEnabled = false,
    this.errorMessage,
  });

  final String title;
  final String url;
  final AppLocalizedStrings strings;
  final bool isLoading;
  final bool isRemoteEnabled;
  final String? errorMessage;

  LegalDocumentUiState copyWith({
    String? title,
    String? url,
    AppLocalizedStrings? strings,
    bool? isLoading,
    bool? isRemoteEnabled,
    String? errorMessage,
  }) {
    return LegalDocumentUiState(
      title: title ?? this.title,
      url: url ?? this.url,
      strings: strings ?? this.strings,
      isLoading: isLoading ?? this.isLoading,
      isRemoteEnabled: isRemoteEnabled ?? this.isRemoteEnabled,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
