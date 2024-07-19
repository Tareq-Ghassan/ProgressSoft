import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [ConfigrationEvent] `immutable` class created to hold events
@immutable
abstract class ConfigrationEvent extends Equatable {
  /// [ConfigrationEvent] constructor
  const ConfigrationEvent();
  @override
  List<Object> get props => [];
}

///[FetchConfigration] fetch event
class FetchConfigration extends ConfigrationEvent {
  ///[FetchConfigration] constructor
  const FetchConfigration();

  ///[props]
  @override
  List<Object> get props => super.props;
}

///[ResetConfigration] reset event
class ResetConfigration extends ConfigrationEvent {
  ///[ResetConfigration] constructor
  const ResetConfigration();

  ///[props]
  @override
  List<Object> get props => super.props;
}
