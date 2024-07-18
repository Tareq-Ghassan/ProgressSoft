import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/screens/otp.dart';
import 'package:progress_soft/presentation/screens/root.dart';

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

/// [validatePassword] this function is to excute validation on
/// password Field
String? validatePassword(BuildContext context, String? value) {
  final appLocalizations = AppLocalizations.of(context)!;

  if (value != null) {
    if (value.isEmpty) {
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
void onSubmitRegister() {
  Navigator.push(
    navigatorKey.currentContext!,
    material.MaterialPageRoute<dynamic>(
      builder: (context) => const OTPScreen(),
    ),
  );

  // final userCredential =
  //     await _firebase.createUserWithEmailAndPassword(
  //   email: '$_phone@domain.com',
  //   password: _cPassword,
  // );

  // final userId = userCredential.user!.uid;
  // await FirebaseFirestore.instance
  //     .collection('profile')
  //     .doc(userId) // Use userId as the document ID
  //     .set({
  //   'name': _fullName,
  //   'phone': _phone,
  //   'age': _selectedAge,
  //   'gender': dropdownValue,
  // }).then((_) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute<dynamic>(
  //       builder: (context) => const OTPScreen(),
  //     ),
  //   );
  // });
}
