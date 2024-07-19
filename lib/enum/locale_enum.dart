/// [Lang] is an enum class holds languages available in app
enum Lang {
  /// [english] English language
  english,

  /// [arabic] Arabic language
  arabic,
}

///[LangExtension] Extenion on [Lang]
extension LangExtension on Lang {
  /// [value] return value of language as [String] 'en' or 'ar'
  String get value {
    switch (this) {
      case Lang.english:
        return 'en';
      case Lang.arabic:
        return 'ar';
    }
  }
}
