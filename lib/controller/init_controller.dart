import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/screens/login_screen.dart';
import 'package:progress_soft/presentation/screens/root.dart';

/// [initApp] function to initialize the app
void initApp() {
  Timer(
    const Duration(milliseconds: 300),
    () {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute<dynamic>(
          builder: (context) => const LoginScreen(),
        ),
      );
    },
  );
}
