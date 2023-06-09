import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);
}

class InternetFailure extends Failure {
  final String message;

  InternetFailure(this.message);
}

class ServerFailureMessage extends Failure {
  final String message;

  ServerFailureMessage(this.message);
}

class FailureMessage extends Failure {
  final String message;

  FailureMessage(this.message);
}

class CacheFailure extends Failure {}

class AuthFailure extends Failure {}
