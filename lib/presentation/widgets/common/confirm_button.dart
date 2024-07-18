import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/size.dart';

/// [ConfrimButton] represent confirmation button `Elevated`
class ConfrimButton extends StatelessWidget {
  /// [ConfrimButton] constructor
  const ConfrimButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  /// [onPressed] void call back function
  final VoidCallback? onPressed;

  /// [title] title of button
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
