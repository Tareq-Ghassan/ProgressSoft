import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/controller/otp_view_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

/// [OTPTextField] represent Otp TEXT FIELD
class OTPTextField extends StatelessWidget {
  ///[OTPTextField] Constructor
  const OTPTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PinFieldAutoFill(
            autoFocus: true,
            currentCode: context.read<OTPCubit>().state,
            decoration: BoxLooseDecoration(
              radius: const Radius.circular(12),
              strokeColorBuilder: const FixedColorBuilder(
                greenColor,
              ),
            ),
            onCodeChanged: (code) {
              debugPrint('OnCodeChanged : $code');
              code = replaceArabicNumber(code ?? '');
              context.read<OTPCubit>().setOTP(newVal: code);

              if (context.read<OTPCubit>().state.length == 6) {
                verifyOTP(
                  context.read<OTPCubit>().state,
                );
              }
            },
            onCodeSubmitted: (val) {
              debugPrint('OnCodeSubmitted : $val');
            },
          ),
        ],
      ),
    );
  }
}

/// [replaceArabicNumber] to convert arabic numbers to english
String replaceArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  var result = input;
  for (var i = 0; i < english.length; i++) {
    result = result.replaceAll(arabic[i], english[i]);
  }
  debugPrint(result);
  return result;
}
