import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/size.dart';
import 'package:progress_soft/presentation/widgets/common/textfield/password_txfield.dart';
import 'package:progress_soft/presentation/widgets/common/textfield/phone_number_txfield.dart';

/// [LoginForm] represent login Form
class LoginForm extends StatelessWidget {
  /// [LoginForm] consturctor
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pt16),
      child: const Form(
        child: Column(
          children: [
            PhoneNumberTextField(),
            _size,
            PasswordTextField(),
          ],
        ),
      ),
    );
  }

  static const _size = SizedBox(
    height: 16,
  );
}
