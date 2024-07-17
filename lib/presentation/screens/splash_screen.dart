import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/locale/locale_bloc.dart';
import 'package:progress_soft/constants/enum/locale_enum.dart';

/// [SplashScreen] represent the splash screen
class SplashScreen extends StatefulWidget {
  /// [SplashScreen] Construtor
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              appLocalizations.login,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final cubit = context.read<LocaleCubit>();
          final currentLocale = cubit.state;
          if (currentLocale.languageCode == Lang.english.value) {
            cubit.setLocale(Locale(Lang.arabic.value));
          } else {
            cubit.setLocale(Locale(Lang.english.value));
          }
        },
        child: const Text('Change Locale'),
      ),
    );
  }
}
