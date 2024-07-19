import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/enum/locale_enum.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/controller/login_view_controller.dart';

///[PhoneNumberTextField] represent phone number text field
class PhoneNumberTextField extends StatelessWidget {
  ///[PhoneNumberTextField] constructor
  const PhoneNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return TextFormField(
      autocorrect: false,
      autofillHints: const [
        AutofillHints.telephoneNumberDevice,
      ],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(
          horizontal: pt16,
        ),
        filled: true,
        fillColor: Colors.transparent,
        hintText: appLocalizations.phoneNumber,
        prefixIcon:
            Localizations.localeOf(context).toString() == Lang.english.value
                ? Padding(
                    padding: EdgeInsets.only(left: pt16),
                    child: const DropMenu(),
                  )
                : null,
        suffixIcon:
            Localizations.localeOf(context).toString() == Lang.arabic.value
                ? Padding(
                    padding: EdgeInsets.only(left: pt16),
                    child: const Directionality(
                      textDirection: TextDirection.ltr,
                      child: DropMenu(),
                    ),
                  )
                : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 15,
      onSaved: (value) {
        if (value != null) {
          context.read<PhoneNumberCubit>().setPhone(newVal: value);
        } else {
          context.read<PhoneNumberCubit>().setPhone(newVal: '');
        }
      },
      textInputAction: TextInputAction.next,
      validator: (value) => validatePhoneNumber(
        context,
        value,
        context.read<CountryCodeCubit>().state,
      ),
    );
  }
}

/// [DropMenu] a dropMenu for Country code
class DropMenu extends StatelessWidget {
  ///[DropMenu] constructor
  const DropMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      initialSelection: BlocProvider.of<ConfigrationBloc>(context)
          .state
          .props
          .first
          .countryCodes!
          .codes![0],
      onSelected: (String? value) {
        if (value != null) {
          context.read<CountryCodeCubit>().setCountryCode(newVal: value);
        } else {
          context.read<CountryCodeCubit>().setCountryCode(newVal: '962');
        }
      },
      dropdownMenuEntries: BlocProvider.of<ConfigrationBloc>(context)
          .state
          .props
          .first
          .countryCodes!
          .codes!
          .map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}
