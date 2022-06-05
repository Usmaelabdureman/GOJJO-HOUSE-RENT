part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {}

class SuccessOperation extends PostState {
  final Iterable<Post> posts;

  const SuccessOperation([this.posts = const []]);

  @override
  List<Object> get props => [posts];
}

class FailedOperation extends PostState {
  final Object error;

  const FailedOperation(this.error);
  @override
  List<Object> get props => [error];
}
