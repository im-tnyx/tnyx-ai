enum AppFontType {
  system,
  plusJakartaSans,
  notoSansDevanagari,
}

sealed class TnyxFonts {
  static const String plusJakartaSans = 'PlusJakartaSans';
  static const String notoSansDevanagari = 'NotoSansDevanagari';

  static const AppFontType defaultFontType = AppFontType.plusJakartaSans;

  static String? getFamily(AppFontType fontType) {
    switch (fontType) {
      case AppFontType.system:
        return null;
      case AppFontType.plusJakartaSans:
        return plusJakartaSans;
      case AppFontType.notoSansDevanagari:
        return notoSansDevanagari;
    }
  }
}
