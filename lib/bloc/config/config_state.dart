import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/data/model/configration.dart';

@immutable
abstract class ConfigrationState extends Equatable {
  const ConfigrationState();
  @override
  List<AppConfig> get props => [];
}

class ConfigrationIsNotSearched extends ConfigrationState {}

class ConfigrationIsLoading extends ConfigrationState {}

class ConfigrationIsLoaded extends ConfigrationState {
  final AppConfig _appConfig;

  const ConfigrationIsLoaded(
    this._appConfig,
  );

  AppConfig get getConfig => _appConfig;
  @override
  List<AppConfig> get props => [_appConfig];
}

class ConfigrationFailure extends ConfigrationState {}

class ConfigrationCatch extends ConfigrationState {}
