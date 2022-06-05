part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostLoad extends PostEvent {
  const PostLoad();

  @override
  List<Object> get props => [];
}

class PostCreate extends PostEvent {
  final Post post;

  const PostCreate(this.post);

  @override
  List<Object> get props => [post];

  @override
  String toString() => 'Post Created {post Id: ${post.id}}';
}

class PostUpdate extends PostEvent {
  final int id;
  final dynamic post;

  const PostUpdate(this.id, this.post);

  @override
  List<Object> get props => [id, post];

  @override
  String toString() => 'Post Updated {post Id: ${post.id}}';
}

class PostDelete extends PostEvent {
  final String id;

  const PostDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Post Deleted {Post Id: $id}';

  @override
  bool? get stringify => true;
}
