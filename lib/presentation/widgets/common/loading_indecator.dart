import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [LoadingIndicatorDialog] this is a Custom Widget to show loading widget
///
/// ex:
/// ```dart
/// Scaffold(
///   body: LoadingIndicatorDialog().showDialog()
/// );
/// ```
class LoadingIndicatorDialog {
  /// [LoadingIndicatorDialog]  constructor
  factory LoadingIndicatorDialog() {
    return _singleton;
  }
  LoadingIndicatorDialog._internal();
  static final LoadingIndicatorDialog _singleton =
      LoadingIndicatorDialog._internal();
  late BuildContext _context;

  ///[isDisplayed] show hide flag
  bool isDisplayed = false;

  ///[show] function to show loading indecator
  void show(BuildContext context) {
    if (isDisplayed) {
      return;
    }
    final text = AppLocalizations.of(context)!.loading;
    showDialog<void>(
      barrierColor: Colors.white70,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _context = context;
        isDisplayed = true;
        return PopScope(
          canPop: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: SimpleDialog(
              backgroundColor: Colors.white,
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(text),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// [dismiss] function to dissmis loading
  void dismiss() {
    if (isDisplayed) {
      try {
        Navigator.of(_context).pop();
      } catch (e) {
        debugPrint(e.toString());
        // Handle the exception, e.g., context might be null
      } finally {
        isDisplayed = false;
      }
    }
  }
}
