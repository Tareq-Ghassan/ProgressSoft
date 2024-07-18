/// [AppConfig] class to hold app conigration
class AppConfig {
  /// [AppConfig] Constructor
  AppConfig({this.regex, this.errorMapping});

  /// [regex] holds app regex
  RegexConfig? regex;

  /// [errorMapping] holds app errors
  Map<String, ErrorMapping>? errorMapping;

  /// [mapDocuments] a function to map documaents to an Objects
  void mapDocuments(String docId, Map<String, dynamic> data) {
    switch (docId) {
      case 'regex':
        regex = RegexConfig.fromMap(data);
      case 'errorMapping':
        errorMapping = data.map(
          (key, value) => MapEntry(
            key,
            ErrorMapping.fromMap(value as Map<String, dynamic>),
          ),
        );
    }
  }
}

///[ErrorMapping] class created for errors
class ErrorMapping {
  /// [ErrorMapping] constructor
  ErrorMapping({required this.en, required this.ar});

  ///[ErrorMapping.fromMap] a `factory` function to map error describtion
  factory ErrorMapping.fromMap(Map<String, dynamic> map) {
    return ErrorMapping(
      en: map['en'] as String,
      ar: map['ar'] as String,
    );
  }

  /// [en] describtion
  final String en;

  /// [ar] describtion
  final String ar;
}

/// [RegexConfig] class holds REGEX for all app
class RegexConfig {
  /// [RegexConfig] constructor
  RegexConfig({required this.passwordRegex});

  ///[RegexConfig.fromMap] a `factory` function to map regx
  factory RegexConfig.fromMap(Map<String, dynamic> map) {
    return RegexConfig(
      passwordRegex: map['passwordRegex'] as String,
    );
  }

  /// [passwordRegex] holds password regex
  final String passwordRegex;
}
