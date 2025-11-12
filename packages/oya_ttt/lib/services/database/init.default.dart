import 'package:drift/native.dart';
import 'package:oya_ttt/services/database/database.dart';

AppDatabase initDatabase() {
  return AppDatabase(NativeDatabase.memory());
}
