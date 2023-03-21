import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../domain/repositories/user_repositories.dart';
import '../datasource/users_local_src.dart';
import '../models/response_model.dart';

class UserRepositoryImpl extends UserRepository {
  UsersLocalSrc usersLocalSrc;

  UserRepositoryImpl(this.usersLocalSrc);

  @override
  Stream<Either<Failure, List<Result>>> getUsers() async* {
    try {
      var response = await usersLocalSrc.getUsers();
      yield Right(response);
    } catch (e, s) {
      Failure error = await checkErrorState(e, s);
      yield Left(error);
    }
  }

  Future<Failure> checkErrorState(e, StackTrace s) async {
    return FailureMessage(e.toString());
  }
}
