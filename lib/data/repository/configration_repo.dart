import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/data/model/configration.dart';

/// [ConfigartionRepository] a repository class for app configartion
class ConfigartionRepository {
  /// [getConfigration] function to get the app configartion
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
      return null; // Return null if no documents are found
    } catch (e) {
      debugPrint('Error getting configuration: $e');
      throw Exception('Failed to load configuration');
    }
  }
}
