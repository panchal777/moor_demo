import 'package:moor/moor.dart';

class UserModel extends Table {
  IntColumn get pId => integer().autoIncrement()();

  TextColumn get user => text()();
}
