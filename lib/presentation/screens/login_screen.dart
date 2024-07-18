import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/screens/home_screen.dart';
import 'package:progress_soft/presentation/screens/register_screen.dart';
import 'package:progress_soft/presentation/widgets/common/confirm_button.dart';
import 'package:progress_soft/presentation/widgets/login/login_header.dart';
import 'package:progress_soft/presentation/widgets/login/or.dart';

final _firebase = FirebaseAuth.instance;

/// [LoginScreen] represent the login screen
class LoginScreen extends StatefulWidget {
  /// [LoginScreen] Construtor
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _phone = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

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
                    Padding(
                      padding: EdgeInsets.all(pt16),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              autocorrect: false,
                              autofillHints: const [
                                AutofillHints.telephoneNumberDevice,
                              ],
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: pt16),
                                // prefixIconColor: Colors.black,
                                filled: true,
                                fillColor: Colors.transparent,

                                hintText: appLocalizations.phoneNumber,
                              ),
                              // validator: (value) => validateInputUser(context, value),
                              onChanged: (value) {
                                _phone = value;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  _phone = newValue;
                                }
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              autofillHints: const [
                                AutofillHints.password,
                              ],
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                suffixIcon: hidePassword
                                    ? InkWell(
                                        onTap: () {
                                          final cubit =
                                              context.read<HidePasswordCubit>();
                                          final hidePasswordState = cubit.state;
                                          cubit.setHidePassword(
                                            newVal: !hidePasswordState,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.visibility_off_outlined,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          final cubit =
                                              context.read<HidePasswordCubit>();
                                          final hidePasswordState = cubit.state;
                                          cubit.setHidePassword(
                                            newVal: !hidePasswordState,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.visibility_outlined,
                                        ),
                                      ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: pt16),
                                filled: true,
                                fillColor: Colors.transparent,
                                prefixIcon: Image.asset(
                                  AppIcons.of(context).lock,
                                  color: royalBlueColor,
                                ),
                                hintText: appLocalizations.password,
                              ),
                              onChanged: (value) {
                                _password = value;
                              },
                              // validator: (value) => validateInputPassword(context, value),
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  _password = newValue;
                                }
                              },
                              textInputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ConfrimButton(
                      onPressed: () async {
                        await _firebase
                            .signInWithEmailAndPassword(
                          email: '$_phone@domain.com',
                          password: _password,
                        )
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        });
                      },
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
        },
      ),
    );
  }
}
