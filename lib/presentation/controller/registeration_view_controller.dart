import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/screens/otp_screen.dart';
import 'package:progress_soft/presentation/screens/root.dart';

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

/// [containsSpecialCharacter] check if it contains special characters
bool containsSpecialCharacter(String value) {
  return RegExp(r'[@\$\-_]').hasMatch(value);
}

/// [validatePassword] this function is to excute validation on
/// password Field
String? validatePassword(BuildContext context, String? value) {
  final appLocalizations = AppLocalizations.of(context)!;

  if (value != null) {
    // Minimum 1 Special character
    if (containsSpecialCharacter(value)) {
      // Special character found
      navigatorKey.currentContext!
          .read<MinimumOneSpecialCharValidCubit>()
          .setMinimumOneSpecialCharValid(
            newVal: true,
          );
    } else {
      // No special character found
      navigatorKey.currentContext!
          .read<MinimumOneSpecialCharValidCubit>()
          .setMinimumOneSpecialCharValid(
            newVal: false,
          );
    }
    // Minimum 6 characters
    if (value.length > 6) {
      navigatorKey.currentContext!
          .read<MinimumSixCharsValidCubit>()
          .setMinimumSixCharsValid(
            newVal: true,
          );
    } else {
      navigatorKey.currentContext!
          .read<MinimumSixCharsValidCubit>()
          .setMinimumSixCharsValid(
            newVal: false,
          );
    }
    // Minimum 1 digit
    if (RegExp(r'\d').hasMatch(value)) {
      navigatorKey.currentContext!
          .read<MinimumOneDigitValidCubit>()
          .setMinimumOneDigitValidCubit(
            newVal: true,
          );
    } else {
      navigatorKey.currentContext!
          .read<MinimumOneDigitValidCubit>()
          .setMinimumOneDigitValidCubit(
            newVal: false,
          );
    }

    // Minimum 1 lowercase character
    if (RegExp('[a-z]').hasMatch(value)) {
      navigatorKey.currentContext!
          .read<MinimumOneLowerValidCubit>()
          .setMinimumOneLowerValidCubit(
            newVal: true,
          );
    } else {
      navigatorKey.currentContext!
          .read<MinimumOneLowerValidCubit>()
          .setMinimumOneLowerValidCubit(
            newVal: false,
          );
    }

    // Minimum 1 uppercase character
    if (RegExp('[A-Z]').hasMatch(value)) {
      navigatorKey.currentContext!
          .read<MinimumOneUpperValidCubit>()
          .setMinimumOneUpperValidCubit(
            newVal: true,
          );
    } else {
      navigatorKey.currentContext!
          .read<MinimumOneUpperValidCubit>()
          .setMinimumOneUpperValidCubit(
            newVal: false,
          );
    }
    if (value.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        navigatorKey.currentContext!
            .read<MinimumOneUpperValidCubit>()
            .setMinimumOneUpperValidCubit(
              newVal: false,
            );
        navigatorKey.currentContext!
            .read<MinimumOneLowerValidCubit>()
            .setMinimumOneLowerValidCubit(
              newVal: false,
            );
        navigatorKey.currentContext!
            .read<MinimumOneDigitValidCubit>()
            .setMinimumOneDigitValidCubit(
              newVal: false,
            );
        navigatorKey.currentContext!
            .read<MinimumOneSpecialCharValidCubit>()
            .setMinimumOneSpecialCharValid(
              newVal: false,
            );
        navigatorKey.currentContext!
            .read<MinimumSixCharsValidCubit>()
            .setMinimumSixCharsValid(
              newVal: false,
            );
      });
      return appLocalizations.pleaseEnterValidation('pass');
    }
    final regexString =
        context.read<ConfigrationBloc>().state.props.first.regex!.passwordRegex;
    final passRegExp = RegExp(regexString);
    if (!passRegExp.hasMatch(value)) {
      return appLocalizations.followRules;
    }
  } else {
    return appLocalizations.pleaseEnterValidation('pass');
  }

  return null;
}

/// [validateConfirmPassword] this function is to excute validation on
/// confirm password Field
String? validateConfirmPassword(BuildContext context, String? value) {
  final appLocalizations = AppLocalizations.of(context)!;

  if (value != null) {
    if (value.isEmpty) {
      return appLocalizations.pleaseEnterValidation('pass');
    }
    if (context.read<PasswordCubit>().state != value) {
      return appLocalizations.passwordsDoNotMatch;
    }
  } else {
    return appLocalizations.pleaseEnterValidation('pass');
  }

  return null;
}

/// [showAgePickerDialog] function to show dialog for age picker
void showAgePickerDialog(Widget child) {
  showCupertinoModalPopup<void>(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: EdgeInsets.only(top: pt6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}

/// [onSubmitRegister] function to register user
Future<void> onSubmitRegister(GlobalKey<FormState> formKey) async {
  final isVaild = formKey.currentState!.validate();
  if (!isVaild) {
    return;
  }
  formKey.currentState!.save();
  final phone = navigatorKey.currentContext!.read<PhoneNumberCubit>().state;
  final code = navigatorKey.currentContext!.read<CountryCodeCubit>().state;
  await Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute<dynamic>(
      builder: (context) => OTPScreen(phone: '$code$phone'),
    ),
  );
}
