import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/locale/locale_bloc.dart';
import 'package:progress_soft/enum/locale_enum.dart';
import 'package:progress_soft/presentation/constants/images.dart';
import 'package:progress_soft/presentation/constants/size.dart';

/// [LoginHeader] this represent ther Header of our login Screen
class LoginHeader extends StatelessWidget {
  /// [LoginHeader] Constuctor
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final icons = AppImages.of(context);

    final appLocalizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(
        top: pt24,
        right: pt16,
        left: pt16,
      ),
      child: Localizations.override(
        context: context,
        locale: Locale(Lang.english.value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                icons.appIconWithText,
                width: 200,
                height: 100,
                alignment: Alignment.centerLeft,
              ),
            ),
            Localizations.override(
              context: context,
              child: TextButton(
                onPressed: () {
                  final cubit = context.read<LocaleCubit>();
                  final currentLocale = cubit.state;
                  if (currentLocale.languageCode == Lang.english.value) {
                    cubit.setLocale(Locale(Lang.arabic.value));
                  } else {
                    cubit.setLocale(Locale(Lang.english.value));
                  }
                },
                child: Text(
                  appLocalizations.lang,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
