import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/colors.dart';

///[inputDecorationTheme] default Textfeild decoration
final inputDecorationTheme = InputDecorationTheme(
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: redColor),
    borderRadius: BorderRadius.circular(8),
  ),
  border: OutlineInputBorder(
    // borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8),
  ),
  enabledBorder: OutlineInputBorder(
    // borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: OutlineInputBorder(
    // borderSide: const BorderSide(color: Colors.white, width: 3),
    borderRadius: BorderRadius.circular(8),
  ),
);
