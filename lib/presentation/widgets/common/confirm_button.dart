import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/size.dart';

/// [ConfrimButton] represent confirmation button `Elevated`
class ConfrimButton extends StatelessWidget {
  const ConfrimButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pt16),
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
