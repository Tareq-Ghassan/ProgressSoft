import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ConfigrationEvent extends Equatable {
  const ConfigrationEvent();
  @override
  List<Object> get props => [];
}

class FetchConfigration extends ConfigrationEvent {
  const FetchConfigration();
  @override
  List<Object> get props => super.props;
}

class ResetConfigration extends ConfigrationEvent {
  const ResetConfigration();
  @override
  List<Object> get props => super.props;
}
