// web.dart
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:oya_ttt/services/database/database.dart';

AppDatabase initDatabase() {
  return AppDatabase(connectOnWeb());
}

QueryExecutor connectOnWeb() {
  return driftDatabase(
    name: 'oya_ttt',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.dart.js'),
      onResult: (result) {},
    ),
  );
}
