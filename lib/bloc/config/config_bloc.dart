import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/config/config_event.dart';
import 'package:progress_soft/bloc/config/config_state.dart';
import 'package:progress_soft/data/repository/configration_repo.dart';

///[ConfigrationBloc] Configration BloC
class ConfigrationBloc extends Bloc<ConfigrationEvent, ConfigrationState> {
  ///[ConfigrationBloc] constructor
  ConfigrationBloc(this.configartionRepository)
      : super(ConfigrationIsNotSearched()) {
    on<FetchConfigration>((event, emit) async {
      emit(ConfigrationIsLoading());
      try {
        final config = await configartionRepository.getConfigration();
        if (config != null) {
          debugPrint('FetchConfigration event success:');
          emit(ConfigrationIsLoaded(config));
        } else {
          debugPrint('FetchConfigration event: config is null');
          emit(ConfigrationFailure());
        }
      } catch (error) {
        debugPrint('FetchConfigration event: catch ');
        emit(ConfigrationCatch());
        debugPrint(error.toString());
      }
    });
  }

  ///[configartionRepository] holds the repo
  final ConfigartionRepository configartionRepository;
}
