import 'package:dartz/dartz.dart';
import '../../../../core/base/base_failures.dart';
import '../../../../core/base/use_case.dart';
import '../../data/models/response_model.dart';
import '../repositories/user_repositories.dart';

class GetUserCase extends UseCase<List<Result>, NoParams> {
  UserRepository userRepository;

  GetUserCase(this.userRepository);

  @override
  Stream<Either<Failure, List<Result>>> callCase(NoParams params) {
    return userRepository.getUsers();
  }
}
