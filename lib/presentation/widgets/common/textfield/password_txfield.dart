import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/controller/login_view_controller.dart';

///[PasswordTextField] password text field
class PasswordTextField extends StatelessWidget {
  /// [PasswordTextField] constructor
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => HidePasswordCubit(),
      child: BlocBuilder<HidePasswordCubit, bool>(
        builder: (context, hidePassword) {
          return TextFormField(
            maxLength: 30,
            autofillHints: const [
              AutofillHints.password,
            ],
            keyboardType: TextInputType.visiblePassword,
            obscureText: hidePassword,
            decoration: InputDecoration(
              counterText: '',
              suffixIcon: hidePassword
                  ? InkWell(
                      onTap: () {
                        final cubit = context.read<HidePasswordCubit>();
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
                        final cubit = context.read<HidePasswordCubit>();
                        final hidePasswordState = cubit.state;
                        cubit.setHidePassword(
                          newVal: !hidePasswordState,
                        );
                      },
                      child: const Icon(
                        Icons.visibility_outlined,
                      ),
                    ),
              contentPadding: EdgeInsets.symmetric(vertical: pt16),
              filled: true,
              fillColor: Colors.transparent,
              prefixIcon: Image.asset(
                AppIcons.of(context).lock,
                color: royalBlueColor,
              ),
              hintText: appLocalizations.password,
            ),
            validator: (value) => validateInputPassword(context, value),
            onSaved: (value) {
              if (value != null) {
                context.read<PasswordCubit>().setPassword(newVal: value);
              }
            },
            textInputAction: TextInputAction.done,
          );
        },
      ),
    );
  }
}
