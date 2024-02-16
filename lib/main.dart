import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile_assessment/root_widget.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const MobileAssessmentApp());
  }, (exception, stackTrace) async {});
}

// https://run.mocky.io/v3/1ac71c7a-50db-4ad2-b5d9-1d2723d9c0a8
// https://api.dicebear.com/7.x/miniavs/svg?seed=
