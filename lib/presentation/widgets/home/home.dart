import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/presentation/animation/listtile_shimmer_animation.dart';
import 'package:progress_soft/presentation/screens/root.dart';

/// [HomePage] this represent the Home page
class HomePage extends StatelessWidget {
  ///[HomePage] constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          navigatorKey.currentContext!.read<ShimmerCubit>().state
              ? ListTileShimmer(
                  isLoading:
                      navigatorKey.currentContext!.read<ShimmerCubit>().state,
                )
              : const Center(
                  child: Text('home'),
                ),
      itemCount: 10,
    );
  }
}
