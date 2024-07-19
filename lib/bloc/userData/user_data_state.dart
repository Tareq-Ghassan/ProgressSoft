import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/data/model/user_data.dart';

///[UserDataState] `immutable` class created to hold state
@immutable
abstract class UserDataState extends Equatable {
  /// [UserDataState] constructor
  const UserDataState();
  @override
  List<UserData> get props => [];
}

/// [UserDataIsNotSearched] state
class UserDataIsNotSearched extends UserDataState {}

/// [UserDataIsLoading] state
class UserDataIsLoading extends UserDataState {}

/// [UserDataIsLoaded] state
class UserDataIsLoaded extends UserDataState {
  /// [UserDataIsLoaded] constructor
  const UserDataIsLoaded(
    this._userData,
  );
  final UserData _userData;

  /// [getUserData] getter
  UserData get getUserData => _userData;
  @override
  List<UserData> get props => [_userData];
}

/// [UserDataFailure] state
class UserDataFailure extends UserDataState {}

/// [UserDataCatch] state
class UserDataCatch extends UserDataState {}
