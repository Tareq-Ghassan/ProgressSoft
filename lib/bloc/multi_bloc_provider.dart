import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/config/config_bloc.dart';
import 'package:progress_soft/bloc/forms/form_bloc.dart';
import 'package:progress_soft/bloc/locale/locale_bloc.dart';
import 'package:progress_soft/bloc/posts/posts_bloc.dart';
import 'package:progress_soft/bloc/ui/ui_helper_bloc.dart';
import 'package:progress_soft/bloc/userData/user_data_bloc.dart';
import 'package:progress_soft/data/repository/configration_repo.dart';
import 'package:progress_soft/data/repository/posts_repo.dart';
import 'package:progress_soft/data/repository/user_data_repo.dart';

/// [multiBlocProvider] Holds multi BloC provider list
List<BlocProvider> multiBlocProvider = [
  BlocProvider<ConfigrationBloc>(
    create: (context) => ConfigrationBloc(ConfigartionRepository()),
  ),
  BlocProvider<PostsBloc>(
    create: (context) => PostsBloc(PostsRepository()),
  ),
  BlocProvider<UserDataBloc>(
    create: (context) => UserDataBloc(UserDataRepository()),
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
  BlocProvider<OTPCubit>(
    create: (BuildContext context) => OTPCubit(),
  ),
  BlocProvider<VerifiactionIDCubit>(
    create: (BuildContext context) => VerifiactionIDCubit(),
  ),
  BlocProvider<HomeIndexCubit>(
    create: (BuildContext context) => HomeIndexCubit(),
  ),
  BlocProvider<MinimumSixCharsValidCubit>(
    create: (BuildContext context) => MinimumSixCharsValidCubit(),
  ),
  BlocProvider<MinimumOneDigitValidCubit>(
    create: (BuildContext context) => MinimumOneDigitValidCubit(),
  ),
  BlocProvider<MinimumOneLowerValidCubit>(
    create: (BuildContext context) => MinimumOneLowerValidCubit(),
  ),
  BlocProvider<MinimumOneUpperValidCubit>(
    create: (BuildContext context) => MinimumOneUpperValidCubit(),
  ),
  BlocProvider<MinimumOneSpecialCharValidCubit>(
    create: (BuildContext context) => MinimumOneSpecialCharValidCubit(),
  ),
];
