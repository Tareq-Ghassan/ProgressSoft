import 'dart:math';

import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/colors.dart';

/// [randomGradient] a function that randomly chose a gradient color
List<Color> randomGradient() {
  final colors = [
    blueGradient,
    orangeGradient,
    greenGradient,
  ];
  final secureRandom = Random.secure();
  final random = secureRandom.nextInt(colors.length);
  return colors[random];
}
