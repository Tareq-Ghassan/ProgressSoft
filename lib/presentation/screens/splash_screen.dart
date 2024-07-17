import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/animation/animation_bloc.dart';
import 'package:progress_soft/controller/init_controller.dart';
import 'package:progress_soft/presentation/animation/splash_animation.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/screens/root.dart';

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
        initApp();

        // final cubit = navigatorKey.currentContext!.read<AnimationCubit>();
        // final currentAnimation = cubit.state;
        // cubit.setAnimation(newVal: !currentAnimation);
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
    return BlocProvider(
      create: (_) => AnimationCubit(),
      child: BlocBuilder<AnimationCubit, bool>(
        builder: (context, animationDone) {
          return Scaffold(
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
                //[TODO] show text after animation is done
                // if (animationDone) const Text('www.progresssoft.com'),
              ],
            ),
          );
        },
      ),
    );
  }
}
