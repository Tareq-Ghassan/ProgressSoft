import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/presentation/constants/images.dart';
import 'package:progress_soft/presentation/controller/login_view_controller.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:progress_soft/presentation/widgets/common/confirm_button.dart';
import 'package:progress_soft/presentation/widgets/login/login_form.dart';
import 'package:progress_soft/presentation/widgets/login/login_header.dart';
import 'package:progress_soft/presentation/widgets/login/or.dart';

/// [LoginScreen] represent the login screen
class LoginScreen extends StatefulWidget {
  /// [LoginScreen] Construtor
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    navigatorKey.currentContext!.read<PhoneNumberCubit>().setPhone(newVal: '');
    navigatorKey.currentContext!
        .read<CountryCodeCubit>()
        .setCountryCode(newVal: '962');
    navigatorKey.currentContext!.read<PasswordCubit>().setPassword(newVal: '');
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final images = AppImages.of(context);

    return BlocProvider(
      create: (_) => HidePasswordCubit(),
      child: BlocBuilder<HidePasswordCubit, bool>(
        builder: (context, hidePassword) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const LoginHeader(),
                    LoginForm(
                      formKey: _formKey,
                    ),
                    Image.asset(images.signinChart),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ConfrimButton(
                      onPressed: () => submitLogin(_formKey),
                      title: appLocalizations.login,
                    ),
                    const OrWidget(),
                    TextButton(
                      onPressed: registerNav,
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
        },
      ),
    );
  }
}
