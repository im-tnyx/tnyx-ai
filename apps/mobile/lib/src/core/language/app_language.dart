enum AppLanguage {
  english(name: 'English', code: 'en', optionLabel: 'English', flag: '🇺🇸'),
  hindi(name: 'Hindi', code: 'hi', optionLabel: 'हिंदी', flag: '🇮🇳');

  final String name;
  final String code;
  final String optionLabel;
  final String flag;

  const AppLanguage({
    required this.name,
    required this.code,
    required this.optionLabel,
    required this.flag,
  });

  static const List<AppLanguage> supportedLanguages = AppLanguage.values;

  static AppLanguage fromCode(String code) {
    return AppLanguage.values.firstWhere(
      (lang) => lang.code.toLowerCase() == code.toLowerCase(),
      orElse: () => AppLanguage.english,
    );
  }
}
