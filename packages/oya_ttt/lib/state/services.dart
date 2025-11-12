import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:oya_ttt/services/database/database.dart';
import 'package:oya_ttt/services/database/init.dart';
import 'package:oya_ttt/services/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for the application database instance.
///
/// This provider initializes and provides access to the SQLite database
/// used for storing users, games, and game states.
final $database = Provider<AppDatabase>((context) {
  return initDatabase();
});

/// Provider for accessing shared preferences asynchronously.
///
/// This provider is used for storing simple key-value pairs such as
/// the current user ID and current game ID.
final $sharedPreferences = Provider<SharedPreferencesAsync>((context) {
  return SharedPreferencesAsync();
});

/// Provider for the application logger instance.
///
/// This provider initializes and provides access to the logging service
/// used throughout the application for debugging and monitoring.
final $logger = Provider<Logger>((context) {
  return initLogging();
});
