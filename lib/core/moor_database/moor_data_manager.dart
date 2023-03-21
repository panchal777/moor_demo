import 'moor_database.dart';
import 'package:moor_demo/core/moor_database/app_initializer/shared.dart';

class DemoDbManager {
  static DemoMoorDatabase? _database;

  DemoDbManager._privateConstructor();

  static final DemoDbManager instance = DemoDbManager._privateConstructor();

  DemoMoorDatabase getDbInstance() {
    if (_database == null) {
      _database = constructDb();
      return _database!;
    } else {
      return _database!;
    }
  }
}
