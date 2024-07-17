// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// [AppIcons] holds all icons in app , this class was implemented to change
///
/// image path without `restart` but only wiht `HotReload`
class AppIcons extends InheritedWidget {
  /// [AppIcons] Constructor
  const AppIcons({required super.child, required Key super.key});

  /// [of] The state from the closest instance of this class
  ///
  /// that encloses the given context.
  static AppIcons of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppIcons>()!;

  String get appIcon => 'assets/icons/progressSoftLogo.png';

  String get lock => 'assets/icons/lock.png';

  @override
  bool updateShouldNotify(AppIcons oldWidget) => false;
}
