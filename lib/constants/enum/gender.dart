/// [Gender] an enum holds Gender Values
enum Gender {
  /// [male]
  male,

  /// [female]
  female,
}

///[GenderExtension] extension on Gender
extension GenderExtension on Gender {
  /// [name] return the value as string
  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
    }
  }
}

/// [gender] a list of Genders
List<String> gender = <String>[Gender.male.name, Gender.female.name];
