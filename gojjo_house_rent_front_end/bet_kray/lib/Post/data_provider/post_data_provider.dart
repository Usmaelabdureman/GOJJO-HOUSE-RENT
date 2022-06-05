import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post.dart';
import 'package:http/http.dart' as http;

class PostDataProvider {
  static const String baseUrl = "http://127.0.0.1:8000/api/v1/";

  Future<Post> create(Post post) async {
    final preference = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');
    final http.Response response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $access_token',
        },
        body: jsonEncode({
          "id": post.id,
          "city": post.city,
          "subcity": post.subcity,
          "price": post.price,
          "description": post.description,
        }));

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Field to create post");
    }
  }

  Future<Post> fetchPostDetails(String id) async {
    final response = await http.get(Uri.parse("$baseUrl$id/"));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch the post details.");
    }
  }

  Future<List<Post>> fetchAllPost() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final posts = jsonDecode(response.body) as List;
      return posts.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception("Could not fetch the posts");
    }
  }

  Future<Post> update(int id, Post post) async {
    final preference = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');

    final response = await http.put(Uri.parse("$baseUrl$id/"),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $access_token',
        },
        body: jsonEncode({
          "id": id,
          "city": post.city,
          "subcity": post.subcity,
          "price": post.price,
          "description": post.description,
        }));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the post.");
    }
  }

  Future<void> delete(String id) async {
    final preference = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');

    final response = await http.delete(
      Uri.parse("$baseUrl$id/"),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer $access_token',
      },
    );

    if (response.statusCode != 204) {
      throw Exception("Failed to delete the post.");
    }
  }
}
