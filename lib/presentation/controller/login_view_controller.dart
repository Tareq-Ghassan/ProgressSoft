import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/screens/home_screen.dart';
import 'package:progress_soft/presentation/screens/register_screen.dart';
import 'package:progress_soft/presentation/screens/root.dart';

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
Future<void> submitLogin() async {
  await _firebase
      .signInWithEmailAndPassword(
    email: '${navigatorKey.currentContext!.read<PhoneNumberCubit>().state}'
        '@domain.com',
    password: navigatorKey.currentContext!.read<PasswordCubit>().state,
  )
      .then((value) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute<dynamic>(
        builder: (context) => const HomeScreen(),
      ),
    );
  });
}

/// a function to navigate to [RegisterScreen]
void registerNav() => Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute<dynamic>(
        builder: (context) => const RegisterScreen(),
      ),
    );
