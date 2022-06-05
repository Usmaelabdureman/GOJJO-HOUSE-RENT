import 'package:bet_kray/Post/screens/index.dart';
import 'package:http/src/streamed_response.dart';

import '../data_provider/post_data_provider.dart';
import '../models/post.dart';

class PostRepository {
  final PostDataProvider postDataProvider;
  PostRepository(this.postDataProvider);

  Future<Post> create(Post post) async {
    return postDataProvider.create(post);
  }

  Future<Post> fetchPostDetails(String id) async {
    return postDataProvider.fetchPostDetails(id);
  }

  Future<Post> update(int id, Post post) async {
    return postDataProvider.update(id, post);
  }

  Future<List<Post>> fetchAllPost() async {
    return postDataProvider.fetchAllPost();
  }

  Future<void> delete(String id) async {
    return postDataProvider.delete(id);
  }
}
