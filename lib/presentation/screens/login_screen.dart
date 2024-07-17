import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/presentation/widgets/login/login_form.dart';
import 'package:progress_soft/presentation/widgets/login/login_header.dart';

/// [LoginScreen] represent the login screen
class LoginScreen extends StatelessWidget {
  /// [LoginScreen] Construtor
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginHeader(),
              const LoginForm(),
              TextButton(
                onPressed: () {},
                child: Text(
                  appLocalizations.signUp,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
