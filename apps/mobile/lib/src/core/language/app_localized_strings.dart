import 'package:tnyx_mobile/src/core/language/app_language.dart';
import 'package:tnyx_mobile/src/core/config/app_config.dart';

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
    // Legal Screen strings
    required this.uiOnlyModeTitle,
    required this.uiOnlyModeSubtitle,
    required this.legalPlaceholderSections,
    required this.legalInfoText,
    required this.enableRemoteDocsText,
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

  // Legal Screen fields
  final String uiOnlyModeTitle;
  final String uiOnlyModeSubtitle;
  final List<Map<String, String>> legalPlaceholderSections;
  final String legalInfoText;
  final String enableRemoteDocsText;

  static AppLocalizedStrings from(AppLanguage language) {
    const termsUrl = '${AppConfig.legalBaseUrl}/terms';
    const privacyUrl = '${AppConfig.legalBaseUrl}/privacy';

    switch (language) {
      case AppLanguage.hindi:
        return const AppLocalizedStrings(
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
          uiOnlyModeTitle: 'UI-only मोड सक्रिय है',
          uiOnlyModeSubtitle: 'नेटवर्क मोड सक्षम होने के बाद कानूनी सामग्री रिमोट स्रोत से रेंडर होगी।',
          legalInfoText: 'आपकी गोपनीयता और सहमति मायने रखती है। आगे बढ़ने से पहले इस दस्तावेज़ की सावधानीपूर्वक समीक्षा करें।',
          enableRemoteDocsText: 'रिमोट कानूनी दस्तावेज़ सक्षम करने के लिए, इसके साथ चलाएं:',
          legalPlaceholderSections: [
            {
              'title': '1. डेटा हम इकट्ठा करते हैं',
              'body': 'हम ऐप के अनुभव और विश्वसनीयता को बेहतर बनाने के लिए खाता प्रोफ़ाइल विवरण, डिवाइस मेटाडेटा, भाषा प्राथमिकता और फीचर उपयोग टेलीमेट्री संसाधित कर सकते हैं।',
            },
            {
              'title': '2. हम इसका उपयोग क्यों करते हैं',
              'body': 'डेटा का उपयोग मुख्य ऐप संचालन, सुरक्षा जांच, वैयक्तिकरण, विश्लेषण और समस्या निदान के लिए किया जाता है। हम केवल UI मोड में असंबंधित प्रसंस्करण से बचते हैं।',
            },
          ],
        );
      case AppLanguage.english:
        return const AppLocalizedStrings(
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
          uiOnlyModeTitle: 'UI-only mode is active',
          uiOnlyModeSubtitle: 'content will render from remote legal source once network-backed mode is enabled.',
          legalInfoText: 'Your privacy and consent choices matter. Review this document carefully before proceeding.',
          enableRemoteDocsText: 'To enable remote legal docs, run with:',
          legalPlaceholderSections: [
            {
              'title': '1. Data We Collect',
              'body': 'We may process account profile details, device metadata, language preference, and feature usage telemetry to improve the app experience and reliability.',
            },
            {
              'title': '2. Why We Use It',
              'body': 'Data is used for core app operations, security checks, personalization, analytics, and issue diagnosis. We avoid unrelated processing in UI-only mode.',
            },
            {
              'title': '3. Storage & Retention',
              'body': 'Data retention depends on account lifecycle and legal obligations. Temporary caches are removed automatically over time to maintain performance.',
            },
            {
              'title': '4. Third-party Services',
              'body': 'When backend mode is enabled later, infrastructure vendors may be used for hosting, notifications, and authentication, following contractual safeguards.',
            },
            {
              'title': '5. User Controls',
              'body': 'You can update preferences, request export, and request account deletion according to policy. Additional controls appear after backend integration.',
            },
            {
              'title': '6. Security Measures',
              'body': 'We apply secure transport, least-privilege access, and monitoring practices. Sensitive operations are intended to run only on trusted backend paths.',
            },
            {
              'title': '7. Policy Updates',
              'body': 'Legal text can evolve with product updates and regulatory changes. Material updates should be communicated in-app before new processing begins.',
            },
            {
              'title': '8. Contact',
              'body': 'For policy-related concerns, support channels will be listed in production settings. This placeholder exists to validate modal scrolling behavior.',
            },
          ],
        );
    }
  }
}
