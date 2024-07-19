// ignore_for_file: lines_longer_than_80_chars

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:progress_soft/bloc/userData/user_data_bloc.dart';
import 'package:progress_soft/bloc/userData/user_data_state.dart';
import 'package:progress_soft/presentation/animation/listtile_shimmer_animation.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/icons.dart';

/// [ProfilePage] represent Profile page
class ProfilePage extends StatelessWidget {
  /// [ProfilePage] Constructor
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = AppIcons.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) => state is UserDataIsLoading
          ? const ListTileShimmer(
              isLoading: true,
            )
          : state.props.isEmpty
              ? const ListTileShimmer(
                  isLoading: true,
                )
              : ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: yellowColor,
                    child: Text(
                      '${state.props.first.fullName.split(' ')[0][0].toUpperCase()}'
                      ' ${state.props.first.fullName.split(' ')[1][0].toUpperCase()}',
                    ),
                  ),
                  title: Text(state.props.first.fullName),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${appLocalizations.phoneNumber}: '
                        '${state.props.first.phone}',
                      ),
                      Text(
                        '${appLocalizations.gender}: '
                        '${state.props.first.gender}',
                      ),
                      Text(
                        '${appLocalizations.age}: ' '${state.props.first.age}',
                      ),
                    ],
                  ),
                  trailing: TextButton.icon(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    icon: Image.asset(icons.logoutIcon),
                    label: Text(appLocalizations.logout),
                  ),
                ),
    );
  }
}
