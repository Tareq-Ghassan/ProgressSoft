import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/controller/login_view_controller.dart';
import 'package:progress_soft/presentation/widgets/common/textfield/password_txfield.dart';
import 'package:progress_soft/presentation/widgets/common/textfield/phone_number_txfield.dart';

/// [LoginForm] represent login Form
class LoginForm extends StatelessWidget {
  /// [LoginForm] consturctor
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(pt16),
      child: Form(
        child: Column(
          children: [
            const PhoneNumberTextField(),
            _size,
            PasswordTextField(
              title: appLocalizations.password,
              validator: (value) => validateInputPassword(context, value),
              onSaved: (value) {
                if (value != null) {
                  context.read<PasswordCubit>().setPassword(newVal: value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  static const _size = SizedBox(
    height: 16,
  );
}
