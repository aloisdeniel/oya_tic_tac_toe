import 'dart:io' show File;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:oya_ttt/services/database/database.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

AppDatabase initDatabase() {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    file.deleteSync();
    return NativeDatabase(file);
  });
  return AppDatabase(db);
}
