import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/controller/registeration_view_controller.dart';

/// [FullNameTextField] represent full name text field
class FullNameTextField extends StatelessWidget {
  /// [FullNameTextField] constructor
  const FullNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      autofillHints: const [
        AutofillHints.telephoneNumberDevice,
      ],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: pt16,
          horizontal: pt16,
        ),
        filled: true,
        fillColor: Colors.transparent,
        hintText: appLocalizations.fullName,
      ),
      validator: (value) => validateFullname(context, value),
      onSaved: (value) {
        if (value != null) {
          context.read<FullNameCubit>().setFullName(newVal: value);
        }
      },
      textInputAction: TextInputAction.next,
    );
  }
}
