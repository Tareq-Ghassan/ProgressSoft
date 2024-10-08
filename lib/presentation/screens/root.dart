import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:progress_soft/bloc/locale/locale_bloc.dart';
import 'package:progress_soft/bloc/multi_bloc_provider.dart';
import 'package:progress_soft/presentation/constants/theme/theme_data.dart';
import 'package:progress_soft/presentation/screens/splash_screen.dart';

/// [navigatorKey] holds application state
///
/// the Navigator can be directly manipulated without
///
/// first obtaining it from a [BuildContext]
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// [ProgressSoft] is the MaterialApp root Widget
class ProgressSoft extends StatelessWidget {
  /// [ProgressSoft] Constutor
  const ProgressSoft({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: multiBlocProvider,
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            title: 'ProgressSoft',
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale,
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
