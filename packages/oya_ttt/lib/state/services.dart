import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/services/database/database.dart';
import 'package:oya_ttt/services/database/init.dart';
import 'package:oya_ttt/services/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final $database = Provider<AppDatabase>((context) {
  return initDatabase();
});

final $sharedPreferences = Provider<SharedPreferencesAsync>((context) {
  return SharedPreferencesAsync();
});

final $logger = Provider<Logger>((context) {
  return initLogging();
});
