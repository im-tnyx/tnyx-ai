import 'package:tnyx_mobile/core/language/app_language.dart';
import 'package:tnyx_mobile/core/config/app_config.dart';

class AppLocalizedStrings {
  const AppLocalizedStrings({
    required this.localeCode,
    required this.selectLanguageTitle,
    required this.selectLanguageSubtitle,
    required this.searchLanguageHint,
    required this.noLanguageResultsText,
    required this.skipText,
    required this.welcomeTitle,
    required this.featureLines,
    required this.getStartedText,
    required this.signInText,
    required this.termsPrefix,
    required this.termsText,
    required this.andText,
    required this.privacyText,
    required this.termsUrl,
    required this.privacyUrl,
  });

  final String localeCode;
  final String selectLanguageTitle;
  final String selectLanguageSubtitle;
  final String searchLanguageHint;
  final String noLanguageResultsText;
  final String skipText;
  final String welcomeTitle;
  final List<String> featureLines;
  final String getStartedText;
  final String signInText;
  final String termsPrefix;
  final String termsText;
  final String andText;
  final String privacyText;
  final String termsUrl;
  final String privacyUrl;

  static AppLocalizedStrings from(AppLanguage language) {
    final termsUrl = '${AppConfig.legalBaseUrl}/terms';
    final privacyUrl = '${AppConfig.legalBaseUrl}/privacy';

    switch (language) {
      case AppLanguage.english:
        return AppLocalizedStrings(
          localeCode: 'EN',
          selectLanguageTitle: 'Choose Language',
          selectLanguageSubtitle: 'Select your preferred app language',
          searchLanguageHint: 'Search language',
          noLanguageResultsText: 'No language found',
          skipText: 'Skip',
          welcomeTitle: 'Lose Fat. Build Muscle.\nStay Consistent.',
          featureLines: <String>[
            'Log meals with photos, voice, or text',
            'Train like a pro with personalized workouts',
            'Get realtime insights from AI that truly understands you',
          ],
          getStartedText: 'Get Started',
          signInText: 'Sign In',
          termsPrefix: 'By continuing to use the app, you accept our ',
          termsText: 'Terms & Conditions',
          andText: ' and ',
          privacyText: 'Privacy Policy.',
          termsUrl: termsUrl,
          privacyUrl: privacyUrl,
        );
      case AppLanguage.hindi:
        return AppLocalizedStrings(
          localeCode: 'HI',
          selectLanguageTitle: 'भाषा चुनें',
          selectLanguageSubtitle: 'ऐप की पसंदीदा भाषा चुनें',
          searchLanguageHint: 'भाषा खोजें',
          noLanguageResultsText: 'कोई भाषा नहीं मिली',
          skipText: 'अभी छोड़ें',
          welcomeTitle: 'Fat कम करें. Muscle बनाएं.\nConsistent रहें.',
          featureLines: <String>[
            'Photos, voice या text से meals log करें',
            'Personalized workouts के साथ pro की तरह train करें',
            'AI से realtime insights पाएं जो आपको सच में समझे',
          ],
          getStartedText: 'शुरू करें',
          signInText: 'साइन इन',
          termsPrefix: 'ऐप इस्तेमाल जारी रखकर आप हमारे ',
          termsText: 'Terms & Conditions',
          andText: ' और ',
          privacyText: 'Privacy Policy को मानते हैं.',
          termsUrl: termsUrl,
          privacyUrl: privacyUrl,
        );
    }
  }
}
