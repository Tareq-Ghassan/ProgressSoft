import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [UserDataEvent] `immutable` class created to hold events
@immutable
abstract class UserDataEvent extends Equatable {
  /// [UserDataEvent] constructor
  const UserDataEvent();
  @override
  List<Object> get props => [];
}

///[FetchUserData] fetch event
class FetchUserData extends UserDataEvent {
  ///[FetchUserData] constructor
  const FetchUserData();

  ///[props]
  @override
  List<Object> get props => super.props;
}

///[ResetUserData] reset event
class ResetUserData extends UserDataEvent {
  ///[ResetUserData] constructor
  const ResetUserData();

  ///[props]
  @override
  List<Object> get props => super.props;
}
