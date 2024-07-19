import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/data/model/user_data.dart';

/// [UserDataRepository] a repository class for app UserData
class UserDataRepository {
  /// [fetchUserData] function to get user data
  Future<UserData?> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userProfile = await FirebaseFirestore.instance
          .collection('profile')
          .doc(user.uid)
          .get();

      if (userProfile.exists) {
        final data = userProfile.data() ?? {};
        return UserData.fromMap(data);
      } else {
        debugPrint('No user profile found.');
        return null;
      }
    } else {
      debugPrint('No user is logged in.');
      throw Exception('Failed to load user data');
    }
  }
}
