import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

Logger initLogging() {
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
  return Logger.root;
}
