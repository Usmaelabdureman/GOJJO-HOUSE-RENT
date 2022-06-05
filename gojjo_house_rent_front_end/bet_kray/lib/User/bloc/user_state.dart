part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserListLoading extends UserState {}

class OperationSuccess extends UserState {
  final Iterable<User> users;

  const OperationSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class OperationFailed extends UserState {
  final Object error;

  const OperationFailed(this.error);
  @override
  List<Object> get props => [error];
}

class SignUpSuccessFullyCompleted extends UserState {
  final User user;

  const SignUpSuccessFullyCompleted(this.user);

  @override
  List<Object> get props => [user];
}

class SignUpFailed extends UserState {
  final Object error;

  const SignUpFailed(this.error);

  @override
  List<Object> get props => [error];
}

class RegistrationProcessing extends UserState {}