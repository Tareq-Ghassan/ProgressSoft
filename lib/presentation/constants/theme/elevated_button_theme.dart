import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/colors.dart';
import 'package:progress_soft/presentation/constants/size.dart';

///[elevatedButtonTheme] default elevated Button Theme
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return elevatedButtonColor;
        // Use the default background color for other states
      },
    ),
    foregroundColor: const MaterialStatePropertyAll(whiteColor),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(pt8),
        side: const BorderSide(color: whiteColor),
      ),
    ),
  ),
);
