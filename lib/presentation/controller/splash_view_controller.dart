import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/config/config_state.dart';
import 'package:progress_soft/presentation/screens/login_screen.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:progress_soft/presentation/widgets/common/dialog.dart';

/// [splashListenerController] the function that handle UI for Bloc state
void splashListenerController(BuildContext context, ConfigrationState state) {
  final appLocalizations = AppLocalizations.of(context)!;
  if (state is ConfigrationIsLoaded) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<dynamic>(
        builder: (context) => const LoginScreen(),
      ),
    );
  } else if (state is ConfigrationFailure) {
    unawaited(
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => CustomDialogBox(
          title: appLocalizations.somethingWentWrong,
          descriptions: appLocalizations.somethingWentWrongDescription,
          yesButtontext: appLocalizations.exit,
          yesButtontOnTap: () => exit(0),
        ),
      ),
    );
  } else if (state is ConfigrationCatch) {
    unawaited(
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => CustomDialogBox(
          title: appLocalizations.internalServerError,
          descriptions: appLocalizations.internalServerErrorDescription,
          yesButtontext: appLocalizations.exit,
          yesButtontOnTap: () => exit(0),
        ),
      ),
    );
  }
}
