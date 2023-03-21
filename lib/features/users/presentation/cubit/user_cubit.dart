import '../../../../core/base/use_case.dart';
import '../../domain/usecases/get_user_case.dart';
import 'user_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserCubitState> {
  GetUserCase? userCase;

  UserCubit({this.userCase}) : super(StateInitial());

  getUsers({bool isBackgroundEvent = false}) {
    userCase!
        .callCase(UserParam(isBackgroundEvent: isBackgroundEvent))
        .listen((data) {
      data.fold((onError) {
        emit(UserErrorState(onError.toString()));
      }, (response) {
        emit(FetchUserSuccessState(
            list: response,
            msg: 'List fetched',
            isBackgroundEvent: isBackgroundEvent));
      });
    });
  }
}
