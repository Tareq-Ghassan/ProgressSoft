import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/widgets/common/mobile_number_textfield.dart';
import 'package:progress_soft/presentation/widgets/registeration/age_picker.dart';
import 'package:progress_soft/presentation/widgets/registeration/gender_picker.dart';

/// [RegisterForm] represnt login form
class RegisterForm extends StatelessWidget {
  /// [RegisterForm] constructor
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => HidePasswordCubit(),
      child: BlocBuilder<HidePasswordCubit, bool>(
        builder: (context, hidePassword) {
          return Padding(
            padding: EdgeInsets.all(pt16),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
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
                  ),
                  _space,
                  const PhoneNumberTextFormField(),
                  _space,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgePicker(),
                      _space,
                      GenderPicker(),
                    ],
                  ),
                  _space,
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      suffixIcon: hidePassword
                          ? InkWell(
                              onTap: () {
                                final cubit = context.read<HidePasswordCubit>();
                                final hidePasswordState = cubit.state;
                                cubit.setHidePassword(
                                  newVal: !hidePasswordState,
                                );
                              },
                              child: const Icon(
                                Icons.visibility_off_outlined,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                final cubit = context.read<HidePasswordCubit>();
                                final hidePasswordState = cubit.state;
                                cubit.setHidePassword(
                                  newVal: !hidePasswordState,
                                );
                              },
                              child: const Icon(
                                Icons.visibility_outlined,
                              ),
                            ),
                      contentPadding: EdgeInsets.symmetric(vertical: pt16),
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: Image.asset(
                        AppIcons.of(context).lock,
                        color: royalBlueColor,
                      ),
                      hintText: appLocalizations.password,
                    ),
                    // onChanged: (value) => {
                    //   _password = value,
                    // },
                    // validator: (value) => validateInputPassword(context, value),
                    // onSaved: (newValue) => {
                    //   _password = newValue,
                    // },
                    textInputAction: TextInputAction.done,
                  ),
                  _space,
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      suffixIcon: hidePassword
                          ? InkWell(
                              onTap: () {
                                final cubit = context.read<HidePasswordCubit>();
                                final hidePasswordState = cubit.state;
                                cubit.setHidePassword(
                                  newVal: !hidePasswordState,
                                );
                              },
                              child: const Icon(
                                Icons.visibility_off_outlined,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                final cubit = context.read<HidePasswordCubit>();
                                final hidePasswordState = cubit.state;
                                cubit.setHidePassword(
                                  newVal: !hidePasswordState,
                                );
                              },
                              child: const Icon(
                                Icons.visibility_outlined,
                              ),
                            ),
                      contentPadding: EdgeInsets.symmetric(vertical: pt16),
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: Image.asset(
                        AppIcons.of(context).lock,
                        color: royalBlueColor,
                      ),
                      hintText: appLocalizations.password,
                    ),
                    // onChanged: (value) => {
                    //   _password = value,
                    // },
                    // validator: (value) => validateInputPassword(context, value),
                    // onSaved: (newValue) => {
                    //   _password = newValue,
                    // },
                    textInputAction: TextInputAction.done,
                  ),
                  _space,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static const _space = SizedBox(
    height: 16,
    width: 16,
  );
}
