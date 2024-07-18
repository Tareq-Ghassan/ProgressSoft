import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// * validate if fullname is empty or not
String? validateFullname(BuildContext context, String? value) {
  final appLocalizations = AppLocalizations.of(context)!;
  if (value != null) {
    final nameParts = value.split(' ');
    if (value.trim().isEmpty) {
      return appLocalizations.pleaseEnterValidation('fullname');
    }

    if (nameParts.length < 2) {
      return appLocalizations.fullnameMustBe2Syllables;
    }
    if (nameParts[0].isEmpty || nameParts[1].isEmpty) {
      return appLocalizations.fullnameMustBe2Syllables;
    }
    return null;
  } else {
    return appLocalizations.pleaseEnterValidation('fullname');
  }
}
