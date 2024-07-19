import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/controller/registeration_view_controller.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:progress_soft/presentation/widgets/common/confirm_button.dart';
import 'package:progress_soft/presentation/widgets/register/register_form.dart';

/// [RegisterScreen] this represnt Registeration screen
class RegisterScreen extends StatefulWidget {
  /// [RegisterScreen] Construtor
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    navigatorKey.currentContext!.read<PhoneNumberCubit>().setPhone(newVal: '');
    navigatorKey.currentContext!
        .read<CountryCodeCubit>()
        .setCountryCode(newVal: '962');
    navigatorKey.currentContext!.read<PasswordCubit>().setPassword(newVal: '');
    navigatorKey.currentContext!.read<AgeCubit>().setAge(newVal: 0);
    navigatorKey.currentContext!.read<GenderCubit>().setGender(newVal: '');
    navigatorKey.currentContext!.read<FullNameCubit>().setFullName(newVal: '');
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: whiteColor,
        title: Text(appLocalizations.signUp),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegisterForm(formKey: _formKey),
              ConfrimButton(
                title: appLocalizations.signUp,
                onPressed: () => onSubmitRegister(_formKey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
