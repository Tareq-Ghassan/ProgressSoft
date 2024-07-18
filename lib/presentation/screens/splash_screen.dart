import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/config/config_state.dart';
import 'package:progress_soft/data/repository/configration_repo.dart';
import 'package:progress_soft/presentation/animation/splash_animation.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/screens/login_screen.dart';
import 'package:progress_soft/presentation/screens/root.dart';
import 'package:progress_soft/presentation/widgets/common/dialog.dart';

/// [SplashScreen] represent the splash screen
class SplashScreen extends StatefulWidget {
  /// [SplashScreen] Construtor
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _animations;
  final String _text =
      AppLocalizations.of(navigatorKey.currentContext!)!.progressSoft;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        /// TODO: fix bloc
        // BlocProvider.of<ConfigrationBloc>(navigatorKey.currentContext!);
        ConfigartionRepository().getConfigration();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
    const offsetStart = 30.5;
    _animations = List.generate(_text.length, (i) {
      return Tween<Offset>(
        begin: const Offset(offsetStart, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            i / _text.length,
            (i + 1) / _text.length,
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icons = AppIcons.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return BlocConsumer<ConfigrationBloc, ConfigrationState>(
      listener: (context, state) {
        if (state is ConfigrationIsLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => const LoginScreen(),
            ),
          );
        } else if (state is ConfigrationFailure) {
          unawaited(
            showDialog(
              context: navigatorKey.currentContext!,
              builder: (context) => CustomDialogBox(
                title: appLocalizations.somethingWentWrong,
                descriptions: appLocalizations.somethingWentWrongDescription,
                yesButtontext: appLocalizations.exit,
                yesButtontOnTap: () => exit(0),
              ),
            ),
          );
        } else if (state is ConfigrationCatch) {
          unawaited(
            showDialog(
              context: navigatorKey.currentContext!,
              builder: (context) => CustomDialogBox(
                title: appLocalizations.internalServerError,
                descriptions: appLocalizations.internalServerErrorDescription,
                yesButtontext: appLocalizations.exit,
                yesButtontOnTap: () => exit(0),
              ),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                icons.appIcon,
                width: 150,
                height: 150,
              ),
            ),
            TextAnimation(animations: _animations, text: _text),
          ],
        ),
      ),
    );
  }
}
