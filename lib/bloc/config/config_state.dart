import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/data/model/configration.dart';

///[ConfigrationState] `immutable` class created to hold state
@immutable
abstract class ConfigrationState extends Equatable {
  /// [ConfigrationState] constructor
  const ConfigrationState();
  @override
  List<AppConfig> get props => [];
}

/// [ConfigrationIsNotSearched] state
class ConfigrationIsNotSearched extends ConfigrationState {}

/// [ConfigrationIsLoading] state
class ConfigrationIsLoading extends ConfigrationState {}

/// [ConfigrationIsLoaded] state
class ConfigrationIsLoaded extends ConfigrationState {
  /// [ConfigrationIsLoaded] constructor
  const ConfigrationIsLoaded(
    this._appConfig,
  );
  final AppConfig _appConfig;

  /// [getConfig] getter
  AppConfig get getConfig => _appConfig;
  @override
  List<AppConfig> get props => [_appConfig];
}

/// [ConfigrationFailure] state
class ConfigrationFailure extends ConfigrationState {}

/// [ConfigrationCatch] state
class ConfigrationCatch extends ConfigrationState {}
