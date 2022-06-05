part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent {
  const LoadUser();

  @override
  List<Object> get props => [];
}

class CreateUser extends UserEvent {
  final User user;

  const CreateUser(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {user Id: ${user.id}}';
}

class UpdateUser extends UserEvent {
  final int id;
  final dynamic user;

  const UpdateUser(this.id, this.user);

  @override
  List<Object> get props => [id, user];

  @override
  String toString() => 'User data update {user Id: ${user.id}}';
}

class DeleteUser extends UserEvent {
  final int id;

  const DeleteUser(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User with {Id: $id} deleted successfully';

  @override
  bool? get stringify => true;
}
