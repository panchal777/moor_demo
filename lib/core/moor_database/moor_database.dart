import 'package:moor/moor.dart';
import '/core/moor_database/models/user_model.dart';
import 'dao/user_dao.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [UserModel], daos: [UserDao])
class DemoMoorDatabase extends _$DemoMoorDatabase {
  DemoMoorDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
