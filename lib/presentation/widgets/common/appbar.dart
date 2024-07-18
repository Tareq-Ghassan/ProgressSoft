import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/colors.dart';

/// [AppBarLinearGradient] this is a custom widget creates an AppBar
/// with linear Gradient
///
/// *[title] must not be null, app bar title,
///
/// *[sizeHight] this is the hight of the app bar by default is 60
///
/// *[actions] property
///
/// *[bottom] property
///
/// This sample shows how to use it
///
/// ```dart
/// Scaffold(
/// appBar: const AppBarLinearGradient(
///   title: "Select currency type",
/// ),
/// ```

class AppBarLinearGradient extends StatelessWidget
    implements PreferredSizeWidget {
  /// Creates a [AppBarLinearGradient] widget.
  const AppBarLinearGradient({
    required this.title,
    this.titleWidget,
    this.actions,
    this.sizeHight,
    this.bottom,
    this.leading,
    this.leadingOnTap,
    this.automaticallyImplyLeading = true,
    super.key,
  });

  /// [title] app bar title,
  final String title;

  /// [title] app bar title,
  final Widget? titleWidget;

  /// [actions] represent app bar actions
  final List<Widget>? actions;

  ///[sizeHight] this is the hight of the app bar by default is 60
  final double? sizeHight;

  /// [bottom] represent app bar tabs
  final PreferredSizeWidget? bottom;

  /// [leading] represent app bar leading
  final Widget? leading;

  /// [leadingOnTap] represent on tap function for leading in case you choose [automaticallyImplyLeading]
  final void Function()? leadingOnTap;

  ////[automaticallyImplyLeading] Controls whether we should try to imply the leading widget if null.
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: const [0.0, 1.0],
          colors: blueAppBarGradient,
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: titleWidget ??
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
        leading: automaticallyImplyLeading
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: leadingOnTap ?? () => Navigator.pop(context),
              )
            : leading,
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(sizeHight ?? 60);
}
