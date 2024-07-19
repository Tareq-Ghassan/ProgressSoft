import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/screens/register_screen.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:progress_soft/presentation/widgets/common/dialog.dart';
import 'package:progress_soft/presentation/widgets/common/loading_indecator.dart';

final _firebase = FirebaseAuth.instance;

/// [validatePhoneNumber] validates phone number field
String? validatePhoneNumber(
  BuildContext context,
  String? value,
  String countryCode,
) {
  final appLocalizations = AppLocalizations.of(context)!;

  if (value != null) {
    if (value.isEmpty) {
      return appLocalizations.pleaseEnterValidation('mobile');
    }
    final regexString =
        context.read<ConfigrationBloc>().state.props.first.regex!.phoneRegex;
    final phoneRegExp = RegExp(regexString);
    // Check both country code and length
    if (!phoneRegExp.hasMatch(value)) {
      return appLocalizations.invalidPhoneNumberFormat;
    }
  } else {
    return appLocalizations.pleaseEnterValidation('mobile');
  }

  return null;
}

/// [validateInputPassword] this function is to excute validation on
/// password Field
///
/// it only check that its not empty
String? validateInputPassword(BuildContext context, String? value) {
  final appLocalizations = AppLocalizations.of(context)!;

  if (value != null) {
    if (value.isEmpty) {
      return appLocalizations.pleaseEnterValidation('pass');
    }
    final regexString = context
        .read<ConfigrationBloc>()
        .state
        .props
        .first
        .regex!
        .passwordValidation;
    final passRegExp = RegExp(regexString);
    if (!passRegExp.hasMatch(value)) {
      return appLocalizations.minimumSixChars;
    }
  } else {
    return appLocalizations.pleaseEnterValidation('pass');
  }

  return null;
}

/// [submitLogin] a function to submit login
Future<void> submitLogin(GlobalKey<FormState> formKey) async {
  final appLocalizations = AppLocalizations.of(navigatorKey.currentContext!)!;
  final isVaild = formKey.currentState!.validate();
  if (!isVaild) {
    return;
  }
  formKey.currentState!.save();
  final phone = navigatorKey.currentContext!.read<PhoneNumberCubit>().state;
  final code = navigatorKey.currentContext!.read<CountryCodeCubit>().state;
  final password = navigatorKey.currentContext!.read<PasswordCubit>().state;
  try {
    LoadingIndicatorDialog().show(navigatorKey.currentContext!);

    await _firebase.signInWithEmailAndPassword(
      email: '$code$phone@domain.com',
      password: password,
    );
    LoadingIndicatorDialog().dismiss();
  } on FirebaseAuthException catch (e) {
    LoadingIndicatorDialog().dismiss();
    debugPrint(e.code);
    if (e.code == 'invalid-credential') {
      unawaited(
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => CustomDialogBox(
            title: appLocalizations.info,
            descriptions: appLocalizations.registerNow,
            yesButtontext: appLocalizations.signUp,
            isYesButtonBlue: true,
            yesButtontOnTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => const RegisterScreen(),
                ),
                (route) => route.isFirst,
              );
            },
            cancelButtontext: appLocalizations.close,
            cancelButtonOnTap: () => Navigator.pop(context),
          ),
        ),
      );
      return;
    }

    unawaited(
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => CustomDialogBox(
          title: appLocalizations.somethingWentWrong,
          descriptions: appLocalizations.somethingWentWrongDescription,
          yesButtontext: appLocalizations.signUp,
          isYesButtonBlue: true,
          yesButtontOnTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          cancelButtontext: appLocalizations.close,
          cancelButtonOnTap: () => Navigator.pop(context),
        ),
      ),
    );
    return;
  }
}

/// a function to navigate to [RegisterScreen]
void registerNav() => Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute<dynamic>(
        builder: (context) => const RegisterScreen(),
      ),
    );
