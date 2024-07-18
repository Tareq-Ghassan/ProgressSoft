import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:sms_autofill/sms_autofill.dart';

final _firebase = FirebaseAuth.instance;

/// [sendOTP] function that sends OTP
Future<void> sendOTP() async {
  await _firebase.verifyPhoneNumber(
    phoneNumber: '',
    timeout: const Duration(seconds: 60),
    verificationCompleted: (PhoneAuthCredential credential) async {
      debugPrint('Verification completed:');
      // Optionally handle auto-retrieval or do nothing here if you do not want
      //to sign in
    },
    verificationFailed: (FirebaseAuthException e) {
      debugPrint('Verification failed: ${e.message}');
    },
    codeSent: (String verificationId, int? resendToken) {
      debugPrint('Verification codeSent:');

      navigatorKey.currentContext!
          .read<VerifiactionIDCubit>()
          .setVerificationID(newVal: verificationId);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      debugPrint('Verification timeOut:');
      // Handle timeout; this can be empty if not needed
    },
  );
}

/// [verifyOTP] a function to verify ENTERED OTP
void verifyOTP(
  String smsCode,
) {
  final credential = PhoneAuthProvider.credential(
    verificationId:
        navigatorKey.currentContext!.read<VerifiactionIDCubit>().state,
    smsCode: smsCode,
  );

  _firebase.signInWithCredential(credential).then((userCredential) {
    if (userCredential.user != null) {
      Navigator.pop(navigatorKey.currentContext!);
    } else {
      debugPrint('Failed to verify OTP:');
    }
  }).catchError((error) {
    debugPrint('Failed to verify OTP: $error');
  });
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
