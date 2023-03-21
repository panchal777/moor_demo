import '../models/response_model.dart';

abstract class UsersLocalSrc {
  Future<List<Result>> getUsers();

}
