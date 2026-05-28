enum AppLanguage {
  english(
    code: 'en',
    shortLabel: 'EN',
    displayName: 'English',
    nativeName: 'English',
    optionLabel: 'ENGLISH',
    flag: '🇺🇸',
  ),
  hindi(
    code: 'hi',
    shortLabel: 'HI',
    displayName: 'Hindi',
    nativeName: 'हिन्दी',
    optionLabel: 'हिन्दी',
    flag: '🇮🇳',
  );

  const AppLanguage({
    required this.code,
    required this.shortLabel,
    required this.displayName,
    required this.nativeName,
    required this.optionLabel,
    required this.flag,
  });

  final String code;
  final String shortLabel;
  final String displayName;
  final String nativeName;
  final String optionLabel;
  final String flag;

  static AppLanguage fromCode(String? code) {
    if (code == null) return AppLanguage.english;
    return AppLanguage.values.firstWhere(
      (language) => language.code == code.toLowerCase(),
      orElse: () => AppLanguage.english,
    );
  }
}
