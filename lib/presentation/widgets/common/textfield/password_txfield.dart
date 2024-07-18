import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/constants/size.dart';

///[PasswordTextField] password text field
class PasswordTextField extends StatelessWidget {
  /// [PasswordTextField] constructor
  const PasswordTextField({
    required this.title,
    required this.validator,
    required this.onSaved,
    this.onChanged,
    super.key,
  });

  ///[title] holds text field title
  final String title;

  /// [validator] validator function
  final String? Function(String?) validator;

  /// [onSaved] onSaved function
  final void Function(String?) onSaved;

  /// [onChanged] onChanged function
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HidePasswordCubit(),
      child: BlocBuilder<HidePasswordCubit, bool>(
        builder: (context, hidePassword) {
          return TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLength: 30,
            autofillHints: const [
              AutofillHints.password,
            ],
            keyboardType: TextInputType.visiblePassword,
            obscureText: hidePassword,
            decoration: InputDecoration(
              counterText: '',
              suffixIcon: EyeSufixIcon(
                iconData: hidePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: pt16),
              filled: true,
              fillColor: Colors.transparent,
              prefixIcon: Image.asset(
                AppIcons.of(context).lock,
                color: royalBlueColor,
              ),
              hintText: title,
            ),
            validator: validator,
            onChanged: onChanged,
            onSaved: onSaved,
            textInputAction: TextInputAction.done,
          );
        },
      ),
    );
  }
}

///[EyeSufixIcon] hold eye sufix icon in text field
class EyeSufixIcon extends StatelessWidget {
  ///[EyeSufixIcon] constructor.
  const EyeSufixIcon({required this.iconData, super.key});

  ///[iconData] pproperty,
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final cubit = context.read<HidePasswordCubit>();
        final hidePasswordState = cubit.state;
        cubit.setHidePassword(
          newVal: !hidePasswordState,
        );
      },
      child: Icon(
        iconData,
      ),
    );
  }
}
