import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/screens/home_screen.dart';
import 'package:progress_soft/presentation/screens/login_screen.dart';

/// [Auth] a stream widget to check user sign-in state
class Auth extends StatelessWidget {
  /// [Auth] constructor
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          debugPrint(snapshot.hasData.toString());
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
