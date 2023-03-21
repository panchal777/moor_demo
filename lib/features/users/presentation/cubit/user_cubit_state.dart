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

  @override
  List<Object?> get props => [msg, list];

  const FetchUserSuccessState({required this.msg, required this.list});
}

class UserErrorState extends UserCubitState {
  final String msg;

  @override
  List<Object?> get props => [msg];

  const UserErrorState(this.msg);
}
