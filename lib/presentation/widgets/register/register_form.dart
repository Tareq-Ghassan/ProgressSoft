import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
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
  const RegisterForm({required this.formKey, super.key});

  ///[formKey] holds form state
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.all(pt16),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FullNameTextField(),
            RegisterForm._space,
            const PhoneNumberTextField(),
            RegisterForm._space,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Text(
              appLocalizations.allowedSpecialCharacters,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
            ),
            BlocBuilder<MinimumSixCharsValidCubit, bool>(
              builder: (context, state) => ValidationRule(
                rule: appLocalizations.minimumSixChars,
                state: state,
              ),
            ),
            BlocBuilder<MinimumOneDigitValidCubit, bool>(
              builder: (context, state) => ValidationRule(
                rule: appLocalizations.minimumOneDigit,
                state: state,
              ),
            ),
            BlocBuilder<MinimumOneLowerValidCubit, bool>(
              builder: (context, state) => ValidationRule(
                rule: appLocalizations.minimumOneLowercaseChar,
                state: state,
              ),
            ),
            BlocBuilder<MinimumOneUpperValidCubit, bool>(
              builder: (context, state) => ValidationRule(
                rule: appLocalizations.minimumOneUppercaseChar,
                state: state,
              ),
            ),
            BlocBuilder<MinimumOneSpecialCharValidCubit, bool>(
              builder: (context, state) => ValidationRule(
                rule: appLocalizations.minimumSpecialCharacters,
                state: state,
              ),
            ),
            RegisterForm._space,
            PasswordTextField(
              title: appLocalizations.confrimPassword,
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

/// [ValidationRule] represent a single validation rule
class ValidationRule extends StatelessWidget {
  /// [ValidationRule] constructor
  const ValidationRule({
    required this.rule,
    required this.state,
    super.key,
  });

  /// [rule] rule string
  final String rule;

  /// [state] the state of rule
  final bool state;

  @override
  Widget build(BuildContext context) {
    final appIcons = AppIcons.of(context);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Image.asset(
          state ? appIcons.check : appIcons.close,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 5),
          child: Text(
            rule,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: state ? greenColor : redColor,
                ),
          ),
        ),
      ],
    );
  }
}
