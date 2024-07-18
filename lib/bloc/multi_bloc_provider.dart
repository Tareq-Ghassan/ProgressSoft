import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/bloc/locale/locale_bloc.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/data/repository/configration_repo.dart';

/// [multiBlocProvider] Holds multi BloC provider list
List<BlocProvider> multiBlocProvider = [
  BlocProvider<ConfigrationBloc>(
    create: (context) => ConfigrationBloc(ConfigartionRepository()),
  ),
  BlocProvider<LocaleCubit>(
    create: (BuildContext context) => LocaleCubit(),
  ),
  BlocProvider<HidePasswordCubit>(
    create: (BuildContext context) => HidePasswordCubit(),
  ),
  BlocProvider<ShimmerCubit>(
    create: (BuildContext context) => ShimmerCubit(),
  ),
  BlocProvider<PasswordCubit>(
    create: (BuildContext context) => PasswordCubit(),
  ),
  BlocProvider<PhoneNumberCubit>(
    create: (BuildContext context) => PhoneNumberCubit(),
  ),
  BlocProvider<FullNameCubit>(
    create: (BuildContext context) => FullNameCubit(),
  ),
  BlocProvider<CountryCodeCubit>(
    create: (BuildContext context) => CountryCodeCubit(),
  ),
  BlocProvider<ConfirmPasswordCubit>(
    create: (BuildContext context) => ConfirmPasswordCubit(),
  ),
  BlocProvider<AgeCubit>(
    create: (BuildContext context) => AgeCubit(),
  ),
  BlocProvider<GenderCubit>(
    create: (BuildContext context) => GenderCubit(),
  ),
];
