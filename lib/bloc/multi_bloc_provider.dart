import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/animation/animation_bloc.dart';
import 'package:progress_soft/bloc/locale/locale_bloc.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';

/// [multiBlocProvider] Holds multi BloC provider list
List<BlocProvider> multiBlocProvider = [
  BlocProvider<LocaleCubit>(
    create: (BuildContext context) => LocaleCubit(),
  ),
  BlocProvider<AnimationCubit>(
    create: (BuildContext context) => AnimationCubit(),
  ),
  BlocProvider<HidePasswordCubit>(
    create: (BuildContext context) => HidePasswordCubit(),
  ),
];
