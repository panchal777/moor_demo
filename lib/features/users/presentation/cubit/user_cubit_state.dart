import 'package:equatable/equatable.dart';

import '../../data/models/response_model.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class StateInitial extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class StateLoading extends UserCubitState {
  @override
  List<Object?> get props => [];
}

class FetchUserSuccessState extends UserCubitState {
  final String msg;
  final List<Result> list;
  final bool isBackgroundEvent;

  @override
  List<Object?> get props => [msg, list, isBackgroundEvent];

  const FetchUserSuccessState(
      {required this.msg, required this.list, required this.isBackgroundEvent});
}

class UserErrorState extends UserCubitState {
  final String msg;

  @override
  List<Object?> get props => [msg];

  const UserErrorState(this.msg);
}
