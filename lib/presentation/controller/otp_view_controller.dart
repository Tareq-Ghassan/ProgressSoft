import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/screens/auth.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:progress_soft/presentation/widgets/common/dialog.dart';
import 'package:progress_soft/presentation/widgets/common/loading_indecator.dart';
import 'package:sms_autofill/sms_autofill.dart';

final _firebase = FirebaseAuth.instance;

/// [sendOTP] function that sends OTP
Future<void> sendOTP(String phone) async {
  final appLocalizations = AppLocalizations.of(navigatorKey.currentContext!)!;
  LoadingIndicatorDialog().show(navigatorKey.currentContext!);
  await _firebase.verifyPhoneNumber(
    phoneNumber: '+$phone',
    timeout: const Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential) async {
      LoadingIndicatorDialog().dismiss();
      debugPrint('Verification completed:');
    },
    verificationFailed: (FirebaseAuthException e) {
      LoadingIndicatorDialog().dismiss();
      debugPrint('Verification failed: ${e.message}');
      Navigator.pop(navigatorKey.currentContext!);
      unawaited(
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => CustomDialogBox(
            title: appLocalizations.somethingWentWrong,
            descriptions: appLocalizations.verificationFailed,
            yesButtontext: appLocalizations.close,
            isYesButtonBlue: true,
            yesButtontOnTap: () => Navigator.pop(context),
          ),
        ),
      );
    },
    codeSent: (String verificationId, int? resendToken) {
      LoadingIndicatorDialog().dismiss();
      debugPrint('Verification codeSent:');

      navigatorKey.currentContext!
          .read<VerifiactionIDCubit>()
          .setVerificationID(newVal: verificationId);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      LoadingIndicatorDialog().dismiss();
      debugPrint('Verification timeOut:');
      unawaited(
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => CustomDialogBox(
            title: appLocalizations.internalServerError,
            descriptions: appLocalizations.internalServerError,
            yesButtontext: appLocalizations.close,
            yesButtontOnTap: () => Navigator.pop(context),
          ),
        ),
      );
    },
  );
}

/// [verifyOTP] a function to verify ENTERED OTP
Future<void> verifyOTP(
  String smsCode,
) async {
  final appLocalizations = AppLocalizations.of(navigatorKey.currentContext!)!;
  LoadingIndicatorDialog().show(navigatorKey.currentContext!);
  final credential = PhoneAuthProvider.credential(
    verificationId:
        navigatorKey.currentContext!.read<VerifiactionIDCubit>().state,
    smsCode: smsCode,
  );

  try {
    final userCredential = await _firebase.signInWithCredential(credential);
    if (userCredential.user != null) {
      LoadingIndicatorDialog().dismiss();
      Navigator.pop(navigatorKey.currentContext!);
      try {
        final phone =
            navigatorKey.currentContext!.read<PhoneNumberCubit>().state;
        final code =
            navigatorKey.currentContext!.read<CountryCodeCubit>().state;
        final password =
            navigatorKey.currentContext!.read<PasswordCubit>().state;
        final age = navigatorKey.currentContext!.read<AgeCubit>().state;
        final gender = navigatorKey.currentContext!.read<GenderCubit>().state;
        final fullName =
            navigatorKey.currentContext!.read<FullNameCubit>().state;

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
          Navigator.pushAndRemoveUntil(
            navigatorKey.currentContext!,
            MaterialPageRoute<dynamic>(
              builder: (context) => const Auth(),
            ),
            (route) => route.isFirst,
          );
        });
        LoadingIndicatorDialog().dismiss();
      } on FirebaseAuthException catch (e) {
        LoadingIndicatorDialog().dismiss();
        debugPrint(e.code);
        unawaited(
          showDialog(
            context: navigatorKey.currentContext!,
            builder: (context) => CustomDialogBox(
              title: appLocalizations.somethingWentWrong,
              descriptions: e.message ?? appLocalizations.somethingWentWrong,
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
    } else {
      debugPrint('Failed to verify OTP:');
      unawaited(
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => CustomDialogBox(
            title: appLocalizations.somethingWentWrong,
            descriptions: appLocalizations.verifyOtpFailed,
            yesButtontext: appLocalizations.close,
            isYesButtonBlue: true,
            yesButtontOnTap: () => Navigator.pop(context),
          ),
        ),
      );
    }
  } on FirebaseAuthException catch (e) {
    debugPrint('Failed to verify OTP: $e');
    unawaited(
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => CustomDialogBox(
          title: appLocalizations.internalServerError,
          descriptions: appLocalizations.internalServerError,
          yesButtontext: appLocalizations.close,
          yesButtontOnTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

///[listenSms] to start listen for SMS
Future<void> listenSms() async {
  await SmsAutoFill().listenForCode();
}

///[closeSms] to close SMS listenner
void closeSms() {
  SmsAutoFill().unregisterListener();
}

/// [maskingSMSnumber] a function to mask phone number
String maskingSMSnumber(String smsnum) {
  final numSpace = smsnum.length - 4;
  var result = '';
  if (numSpace > 0) {
    result = smsnum.replaceRange(0, numSpace, '*' * numSpace);
  }
  return result;
}
