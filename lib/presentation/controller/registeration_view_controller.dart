import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/screens/otp.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:progress_soft/presentation/widgets/common/dialog.dart';
import 'package:progress_soft/presentation/widgets/common/loading_indecator.dart';

final _firebase = FirebaseAuth.instance;

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
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigatorKey.currentContext!
          .read<MinimumOneSpecialCharValidCubit>()
          .setMinimumOneSpecialCharValid(
            newVal: true,
          );
      // });
    } else {
      // No special character found
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigatorKey.currentContext!
          .read<MinimumOneSpecialCharValidCubit>()
          .setMinimumOneSpecialCharValid(
            newVal: false,
          );
      // });
    }

    // Minimum 6 characters
    if (value.length > 6) {
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigatorKey.currentContext!
          .read<MinimumSixCharsValidCubit>()
          .setMinimumSixCharsValid(
            newVal: true,
          );
      // });
    } else {
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigatorKey.currentContext!
          .read<MinimumSixCharsValidCubit>()
          .setMinimumSixCharsValid(
            newVal: false,
          );
      // });
    }

    // Minimum 1 digit
    if (RegExp(r'\d').hasMatch(value)) {
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigatorKey.currentContext!
          .read<MinimumOneDigitValidCubit>()
          .setMinimumOneDigitValidCubit(
            newVal: true,
          );
      // });
    } else {
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigatorKey.currentContext!
          .read<MinimumOneDigitValidCubit>()
          .setMinimumOneDigitValidCubit(
            newVal: false,
          );
      // });
    }

    // Minimum 1 lowercase character
    if (RegExp('[a-z]').hasMatch(value)) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        navigatorKey.currentContext!
            .read<MinimumOneLowerValidCubit>()
            .setMinimumOneLowerValidCubit(
              newVal: true,
            );
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        navigatorKey.currentContext!
            .read<MinimumOneLowerValidCubit>()
            .setMinimumOneLowerValidCubit(
              newVal: false,
            );
      });
    }

    // Minimum 1 uppercase character
    if (RegExp('[A-Z]').hasMatch(value)) {
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigatorKey.currentContext!
          .read<MinimumOneUpperValidCubit>()
          .setMinimumOneUpperValidCubit(
            newVal: true,
          );
      // });
    } else {
      // WidgetsBinding.instance.addPostFrameCallback((_) async {
      navigatorKey.currentContext!
          .read<MinimumOneUpperValidCubit>()
          .setMinimumOneUpperValidCubit(
            newVal: false,
          );
      // });
    }
    if (value.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // You can add any additional logic or state changes here
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
  final appLocalizations = AppLocalizations.of(navigatorKey.currentContext!)!;
  final isVaild = formKey.currentState!.validate();
  if (!isVaild) {
    return;
  }
  formKey.currentState!.save();
  final phone = navigatorKey.currentContext!.read<PhoneNumberCubit>().state;
  final code = navigatorKey.currentContext!.read<CountryCodeCubit>().state;
  final password = navigatorKey.currentContext!.read<PasswordCubit>().state;
  final age = navigatorKey.currentContext!.read<AgeCubit>().state;
  final gender = navigatorKey.currentContext!.read<GenderCubit>().state;
  final fullName = navigatorKey.currentContext!.read<FullNameCubit>().state;

  try {
    LoadingIndicatorDialog().show(navigatorKey.currentContext!);

    final userCredential = await _firebase.createUserWithEmailAndPassword(
      email: '$code$phone@domain.com',
      password: password,
    );

    await FirebaseFirestore.instance
        .collection('profile')
        .doc(userCredential.user!.uid)
        .set({
      'fullName': fullName,
      'phone': '$code$phone',
      'age': age,
      'gender': gender,
    }).then((_) {
      LoadingIndicatorDialog().dismiss();
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute<dynamic>(
          builder: (context) => const OTPScreen(),
        ),
      );
    });
    LoadingIndicatorDialog().dismiss();
  } on FirebaseAuthException catch (e) {
    LoadingIndicatorDialog().dismiss();
    debugPrint(e.code);
    if (e.code == 'user-credential') {
      unawaited(
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => CustomDialogBox(
            title: appLocalizations.somethingWentWrong,
            descriptions: 'invalid credential',
            yesButtontext: appLocalizations.exit,
            yesButtontOnTap: () => Navigator.pop(context),
          ),
        ),
      );
      return;
    }
    if (e.code == 'user-not-found') {
      unawaited(
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => CustomDialogBox(
            title: appLocalizations.somethingWentWrong,
            descriptions: appLocalizations.somethingWentWrongDescription,
            yesButtontext: appLocalizations.exit,
            yesButtontOnTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<dynamic>(
              //     builder: (context) => const RegisterScreen(),
              //   ),
              // );
            },
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(e.message ?? ''),
      ),
    );
  }
}
