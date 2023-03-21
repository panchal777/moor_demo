import 'package:moor/moor.dart';
import 'package:moor_demo/core/moor_database/models/user_model.dart';

import '../moor_database.dart';

part 'user_dao.g.dart';

@UseDao(tables: [UserModel])
class UserDao extends DatabaseAccessor<DemoMoorDatabase> with _$UserDaoMixin {
  final DemoMoorDatabase db;

  UserDao(this.db) : super(db);

  Future<void> insertUsers(String data) {
    // await batch((batch) {
    //   batch.insert(userModel, modelData);
    // });
    //return into(userModel).insert(modelData);
    return into(userModel).insert(UserModelCompanion.insert(user: data));
  }

  Future<List<UserModelData>> getAllUsers() => select(userModel).get();

  Future<int> deleteAllRecords() {
    return delete(userModel).go();
  }
}
