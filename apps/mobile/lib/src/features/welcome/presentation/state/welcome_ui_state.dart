import 'package:flutter/foundation.dart';
import 'package:tnyx_mobile/src/core/language/app_localized_strings.dart';

@immutable
class WelcomeUiState {
  const WelcomeUiState({
    required this.strings,
  });

  final AppLocalizedStrings strings;

  // Helpers to access strings directly
  String get localeCode => strings.localeCode;
  String get skipText => strings.skipText;
  String get title => strings.welcomeTitle;
  List<String> get featureLines => strings.featureLines;
  String get ctaText => strings.getStartedText;
  String get signInText => strings.signInText;
  String get termsPrefix => strings.termsPrefix;
  String get termsText => strings.termsText;
  String get andText => strings.andText;
  String get privacyText => strings.privacyText;

  WelcomeUiState copyWith({
    AppLocalizedStrings? strings,
  }) {
    return WelcomeUiState(
      strings: strings ?? this.strings,
    );
  }
}
