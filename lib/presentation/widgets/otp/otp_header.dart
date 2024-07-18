import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/controller/otp_view_controller.dart';

/// [OTPHeader] represent OTP header screen
class OTPHeader extends StatelessWidget {
  ///[OTPHeader] constructor
  const OTPHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Text(
          appLocalizations.enterVerCode,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: pt10,
        ),
        Text(
          appLocalizations.enterThe6DigitNumber,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: pt10,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            maskingSMSnumber(
              context.read<PhoneNumberCubit>().state,
            ),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: pt20,
        ),
      ],
    );
  }
}
