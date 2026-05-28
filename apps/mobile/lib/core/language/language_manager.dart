import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnyx_mobile/core/language/app_language.dart';

class LanguageManager extends ChangeNotifier {
  static const String _languageKey = 'tnyx_language_code';

  AppLanguage _currentLanguage = AppLanguage.english;

  AppLanguage get currentLanguage => _currentLanguage;

  Future<void> load() async {
    final preferences = await SharedPreferences.getInstance();
    final savedLanguage = preferences.getString(_languageKey);

    if (savedLanguage != null && savedLanguage.isNotEmpty) {
      _currentLanguage = AppLanguage.fromCode(savedLanguage);
      notifyListeners();
      return;
    }

    final systemLanguageCode = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    _currentLanguage = AppLanguage.fromCode(systemLanguageCode);
    notifyListeners();
  }

  void setLanguage(AppLanguage language) {
    if (_currentLanguage == language) return;
    _currentLanguage = language;
    notifyListeners();
    _persistLanguage(language.code);
  }

  Future<void> _persistLanguage(String code) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_languageKey, code);
  }
}
