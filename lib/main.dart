import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_soft/firebase_options.dart';
import 'package:progress_soft/presentation/constants/icons.dart';
import 'package:progress_soft/presentation/constants/images.dart';
import 'package:progress_soft/presentation/screens/root.dart';

void main() async {
  final appIconsKey = GlobalKey();
  final appImagessKey = GlobalKey();
  const progressSoft = ProgressSoft();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
