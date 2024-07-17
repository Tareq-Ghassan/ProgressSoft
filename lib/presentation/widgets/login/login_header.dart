import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/locale/locale_bloc.dart';
import 'package:progress_soft/constants/enum/locale_enum.dart';
import 'package:progress_soft/presentation/constants/images.dart';
import 'package:progress_soft/presentation/widgets/common/underlined_button.dart';

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
      padding: const EdgeInsets.only(
        top: 24,
        right: 16,
        left: 16,
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
              child: UnderlinedTextButton(
                onTap: () {
                  final cubit = context.read<LocaleCubit>();
                  final currentLocale = cubit.state;
                  if (currentLocale.languageCode == Lang.english.value) {
                    cubit.setLocale(Locale(Lang.arabic.value));
                  } else {
                    cubit.setLocale(Locale(Lang.english.value));
                  }
                },
                color: Colors.black,
                text: appLocalizations.lang,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
