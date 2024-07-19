import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/presentation/screens/root.dart';

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
        return AppLocalizations.of(navigatorKey.currentContext!)!.male;
      case Gender.female:
        return AppLocalizations.of(navigatorKey.currentContext!)!.female;
    }
  }
}

/// [gender] a list of Genders
List<String> gender = <String>[Gender.male.name, Gender.female.name];
