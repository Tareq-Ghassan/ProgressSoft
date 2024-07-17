import 'package:flutter/material.dart';

/// [TextAnimation] represent `ProgressSoft` text animation
class TextAnimation extends StatelessWidget {
  /// [TextAnimation] Constructor.
  const TextAnimation({
    required List<Animation<Offset>> animations,
    required String text,
    super.key,
  })  : _animations = animations,
        _text = text;

  final List<Animation<Offset>> _animations;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _animations.map(
        (animation) {
          final index = _animations.indexOf(animation);
          return SlideTransition(
            position: animation,
            child: Text(
              _text[index],
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
