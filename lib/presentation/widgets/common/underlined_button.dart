import 'package:flutter/material.dart';

/// [UnderlinedTextButton] this is a Custom Widget to create underlined text
///
/// button
///
/// ex:
/// ```dart
/// Scaffold(
///   body: UnderlinedTextButton(
///     onTap:() => {},
///     text:"Tareq"
///    ),
/// );
/// ```
/// see also:
/// *[onTap] must not be null, this is the on Tap function
///
/// *[text] must not be null, this represent the text in button,
///
/// *[color] property,
///
/// *[style] property,
class UnderlinedTextButton extends StatelessWidget {
  /// [UnderlinedTextButton] Constructor
  const UnderlinedTextButton({
    required this.onTap,
    required this.text,
    this.color = Colors.white,
    this.style,
    super.key,
  });

  /// *[color] represent the color of underline and text color,
  /// by default is set ot Colors.white
  final Color color;

  /// *[text] must not be null, this represent the text in button,
  final String text;

  /// *[style] this represent the text style in button
  /// in case you want to change it,
  final TextStyle? style;

  /// *[onTap] must not be null, this is the on Tap function
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: color,
            ), // Set underline color and width
          ),
        ),
        child: Text(
          text,
          style: style ??
              TextStyle(
                height: 1, // remove space between line and text
                color: color, // Set text color
                decoration: TextDecoration
                    .none, // Remove default underline from the Text widget
              ),
        ),
      ),
    );
  }
}
