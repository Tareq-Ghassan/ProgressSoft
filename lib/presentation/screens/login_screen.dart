import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/presentation/screens/register_screen.dart';
import 'package:progress_soft/presentation/widgets/common/confirm_button.dart';
import 'package:progress_soft/presentation/widgets/login/login_form.dart';
import 'package:progress_soft/presentation/widgets/login/login_header.dart';
import 'package:progress_soft/presentation/widgets/login/or.dart';

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginHeader(),
              const LoginForm(),
              ConfrimButton(
                onPressed: () {},
                title: appLocalizations.login,
              ),
              const OrWidget(),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const RegisterScreen(),
                  ),
                ),
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
