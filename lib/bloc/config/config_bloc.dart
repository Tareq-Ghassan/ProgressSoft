import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft/bloc/config/config_event.dart';
import 'package:progress_soft/bloc/config/config_state.dart';
import 'package:progress_soft/data/model/configration.dart';
import 'package:progress_soft/data/repository/configration_repo.dart';

class ConfigrationBloc extends Bloc<ConfigrationEvent, ConfigrationState> {
  final ConfigartionRepository configartionRepository;

  ConfigrationBloc(this.configartionRepository)
      : super(ConfigrationIsNotSearched()) {
    on<FetchConfigration>((event, emit) async {
      emit(ConfigrationIsLoading());
      try {
        final config = await configartionRepository.getConfigration();
        if (config != null) {
          emit(ConfigrationIsLoaded(config));
        } else {
          emit(ConfigrationFailure());
        }
      } catch (error) {
        emit(ConfigrationFailure());
        debugPrint(error.toString());
      }
    });
  }

  Future<AppConfig?> getConfigration() async {
    try {
      final QuerySnapshot configSnapshot =
          await FirebaseFirestore.instance.collection('configuration').get();
      if (configSnapshot.docs.isNotEmpty) {
        final config = AppConfig();
        for (final doc in configSnapshot.docs) {
          final data = doc.data() as Map<String, dynamic>? ?? {};
          config.mapDocuments(doc.id, data);
        }
        return config;
      }
      return null;
    } catch (e) {
      debugPrint('Error getting configuration: $e');
      throw Exception('Failed to load configuration');
    }
  }
}
