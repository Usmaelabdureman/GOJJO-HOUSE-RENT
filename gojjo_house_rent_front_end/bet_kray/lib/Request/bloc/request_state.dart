part of 'request_bloc.dart';

abstract class RequestState extends Equatable {
  const RequestState();
  
  @override
  List<Object> get props => [];
}

class RequestLoading extends RequestState{}

class UserRequestOperationSuccess extends RequestState{
  final Iterable<UserRequest> requests;
  const UserRequestOperationSuccess([this.requests = const[]]);

  @override
  List<Object> get props => [requests];
}

class UserRequestOperationFailure extends RequestState {
  final Object error;
  const UserRequestOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}