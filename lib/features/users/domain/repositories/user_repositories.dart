import 'package:dartz/dartz.dart';
import 'package:moor_demo/features/users/data/models/response_model.dart';
import '../../../../core/base/base_failures.dart';

abstract class UserRepository {
  Stream<Either<Failure, List<Result>>> getUsers(bool isBackgroundEvent);
}
