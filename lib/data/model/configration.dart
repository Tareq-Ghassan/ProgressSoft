/// [AppConfig] class to hold app conigration
class AppConfig {
  /// [AppConfig] Constructor
  AppConfig({this.regex, this.errorMapping});

  /// [regex] holds app regex
  RegexConfig? regex;

  CountryCodes? countryCodes;

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
      case 'countryCodes':
        countryCodes = CountryCodes.fromJson(data);
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
  RegexConfig({
    required this.passwordRegex,
    required this.phoneRegex,
    required this.passwordValidation,
  });

  ///[RegexConfig.fromMap] a `factory` function to map regx
  factory RegexConfig.fromMap(Map<String, dynamic> map) {
    return RegexConfig(
      passwordRegex: map['passwordRegex'] as String,
      phoneRegex: map['phoneNumber'] as String,
      passwordValidation: map['passwordValidation'] as String,
    );
  }

  /// [passwordRegex] holds password regex for `new password`
  final String passwordRegex;

  /// [phoneRegex] holds phone regex
  final String phoneRegex;

  /// [passwordValidation]  holds password regex for `login password`
  final String passwordValidation;
}

/// [CountryCodes] holds country code
class CountryCodes {
  /// [CountryCodes] constructor
  CountryCodes({this.codes});

//// [ CountryCodes.fromJson] convert to object
  factory CountryCodes.fromJson(Map<String, dynamic> json) {
    return CountryCodes(
      codes: List<String>.from(json['codes'] as List<dynamic>),
    );
  }

  /// [codes] list of Country codes
  List<String>? codes;
}
