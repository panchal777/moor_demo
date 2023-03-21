import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../../data/models/response_model.dart';
import '../repositories/user_repositories.dart';

class GetUserCase extends UseCase<List<Result>, UserParam> {
  UserRepository userRepository;

  GetUserCase(this.userRepository);

  @override
  Stream<Either<Failure, List<Result>>> callCase(UserParam params) {
    return userRepository.getUsers(params.isBackgroundEvent);
  }
}

class UserParam {
  bool isBackgroundEvent;

  UserParam({this.isBackgroundEvent = false});
}
