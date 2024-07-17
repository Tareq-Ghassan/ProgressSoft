import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/presentation/constants/size.dart';

/// [PhoneNumberTextFormField] represent phone number text field widget
class PhoneNumberTextFormField extends StatelessWidget {
  /// [PhoneNumberTextFormField] constructor.
  const PhoneNumberTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return TextFormField(
      autocorrect: false,
      autofillHints: const [
        AutofillHints.telephoneNumberDevice,
      ],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: pt16),
        // prefixIconColor: Colors.black,
        filled: true,
        fillColor: Colors.transparent,

        hintText: appLocalizations.phoneNumber,
      ),
      // validator: (value) => validateInputUser(context, value),
      // onChanged: (value) => {
      //   _userName = value,
      // },
      // onSaved: (newValue) => {
      //   _userName = newValue,
      // },
      textInputAction: TextInputAction.next,
    );
  }
}
