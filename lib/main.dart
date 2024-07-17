import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/constants/images.dart';
import 'package:progress_soft/presentation/screens/root.dart';

void main() {
  if (kReleaseMode) {
    Logger.root.level = Level.WARNING;
  }
  Logger.root.onRecord.listen((record) {
    debugPrint(
      '${record.level.name}: ${record.time}: '
      '${record.loggerName}: '
      '${record.message}',
    );
  });
  final appIconsKey = GlobalKey();
  final appImagessKey = GlobalKey();
  const progressSoft = ProgressSoft();

  runApp(
    AppImages(
      key: kDebugMode ? GlobalKey() : appImagessKey,
      child: AppIcons(
        key: kDebugMode ? GlobalKey() : appIconsKey,
        child: kDebugMode ? const ProgressSoft() : progressSoft,
      ),
    ),
  );
}
