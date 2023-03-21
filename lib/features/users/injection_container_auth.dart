import 'package:get_it/get_it.dart';
import 'package:moor_demo/features/users/data/datasource/users_local_src.dart';
import 'package:moor_demo/features/users/data/datasource/users_local_src.impl.dart';
import 'package:moor_demo/features/users/data/repositories/users_repositories_impl.dart';
import 'package:moor_demo/features/users/domain/repositories/user_repositories.dart';
import 'package:moor_demo/features/users/domain/usecases/get_user_case.dart';
import 'package:moor_demo/features/users/presentation/cubit/user_cubit.dart';

final demoSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  demoSl.registerFactory(
    () => UserCubit(userCase: demoSl()),
  );

  // Use Cases
  demoSl.registerLazySingleton(() => GetUserCase(demoSl()));

  // Repository
  demoSl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(demoSl()));

  // Data sources
  demoSl.registerLazySingleton<UsersLocalSrc>(
    () => UsersLocalSrcImpl(),
  );
}
