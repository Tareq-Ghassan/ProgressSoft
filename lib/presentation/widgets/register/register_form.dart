import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/controller/registeration_view_controller.dart';
import 'package:progress_soft/presentation/widgets/common/textfield/password_txfield.dart';
import 'package:progress_soft/presentation/widgets/common/textfield/phone_number_txfield.dart';
import 'package:progress_soft/presentation/widgets/register/age_picker.dart';
import 'package:progress_soft/presentation/widgets/register/full_name_txfield.dart';
import 'package:progress_soft/presentation/widgets/register/gender_drop_down.dart';

///[RegisterForm] represent register form
class RegisterForm extends StatelessWidget {
  /// [RegisterForm] constructor
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(pt16),
      child: Form(
        child: Column(
          children: [
            const FullNameTextField(),
            RegisterForm._space,
            const PhoneNumberTextField(),
            RegisterForm._space,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AgePicker(),
                RegisterForm._space,
                GenderDropDown(),
              ],
            ),
            RegisterForm._space,
            PasswordTextField(
              title: appLocalizations.password,
              validator: (value) => validatePassword(context, value),
              onChanged: (value) {
                context.read<PasswordCubit>().setPassword(newVal: value);
              },
              onSaved: (value) {
                if (value != null) {
                  context.read<PasswordCubit>().setPassword(newVal: value);
                }
              },
            ),
            RegisterForm._space,
            PasswordTextField(
              title: appLocalizations.password,
              validator: (value) => validateConfirmPassword(context, value),
              onSaved: (value) {
                if (value != null) {
                  context
                      .read<ConfirmPasswordCubit>()
                      .setConfirmPassword(newVal: value);
                }
              },
            ),
            RegisterForm._space,
          ],
        ),
      ),
    );
  }

  static const _space = SizedBox(
    height: 16,
    width: 16,
  );
}
