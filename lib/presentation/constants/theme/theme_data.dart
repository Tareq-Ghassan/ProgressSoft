import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/theme/input_decoration_theme.dart';

/// [themeData] hold `ThemeData` for all app
final themeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSeed(
    seedColor: whiteColor,
    primary: royalBlueColor,
  ),
  useMaterial3: true,
  inputDecorationTheme: inputDecorationTheme,
);
