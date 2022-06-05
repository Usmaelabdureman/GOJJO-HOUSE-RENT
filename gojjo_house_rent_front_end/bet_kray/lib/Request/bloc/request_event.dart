part of 'request_bloc.dart';
abstract class RequestEvent extends Equatable {
  const RequestEvent();
}
class UserRequestLoad extends RequestEvent{
  const UserRequestLoad();

    @override
  List<Object> get props => [];
}
class UserRequests extends RequestEvent{
  const UserRequests();
  
  @override
  List<Object> get props => [];
}
class RequestCreate extends RequestEvent {
  final UserRequest request;

  const RequestCreate(this.request);

  @override
  List<Object> get props => [request];

  @override
  String toString() => 'Request Created {reqeust Id: ${request.id}}';
}

class RequestUpdate extends RequestEvent {
  final int id;
  final UserRequest request;

  const RequestUpdate(this.id, this.request);

  @override
  List<Object> get props => [id, request];

  @override
  String toString() => 'request Updated {request Id: ${request.id}}';
}

class RequestDelete extends RequestEvent {
  final int id;

  const RequestDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Request Deleted {request Id: $id}';

  @override
  bool? get stringify => true;
}