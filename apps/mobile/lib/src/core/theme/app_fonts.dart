enum AppFontType {
  system,
  plusJakartaSans,
  notoSansDevanagari,
  sfPro,
}

sealed class TnyxFonts {
  static const String plusJakartaSans = 'PlusJakartaSans';
  static const String notoSansDevanagari = 'NotoSansDevanagari';
  static const String sfPro = 'SFPro';

  static const String primary = sfPro;

  static const AppFontType defaultFontType = AppFontType.sfPro;

  static String? getFamily(AppFontType fontType) {
    switch (fontType) {
      case AppFontType.system:
        return null;
      case AppFontType.plusJakartaSans:
        return plusJakartaSans;
      case AppFontType.notoSansDevanagari:
        return notoSansDevanagari;
      case AppFontType.sfPro:
        return sfPro;
    }
  }
}
