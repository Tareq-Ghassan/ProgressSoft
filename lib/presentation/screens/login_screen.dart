import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/widgets/login/login_header.dart';

/// [LoginScreen] represent the login screen
class LoginScreen extends StatelessWidget {
  /// [LoginScreen] Construtor
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
