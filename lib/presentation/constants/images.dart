// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// [AppImages] holds all images in app , this class was implemented to change
///
/// image path without `restart` but only wiht `HotReload`
class AppImages extends InheritedWidget {
  /// [AppImages] Constructor
  const AppImages({required super.child, required Key super.key});

  /// [of] The state from the closest instance of this class
  ///
  /// that encloses the given context.
  static AppImages of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppImages>()!;

  String get appIconWithText => 'assets/images/progressSoftWithText.png';

  @override
  bool updateShouldNotify(AppImages oldWidget) => false;
}
