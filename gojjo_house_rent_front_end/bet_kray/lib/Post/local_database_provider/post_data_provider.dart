import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:sqlite/src/providers/db_provider.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import 'package:dio/dio.dart';

class PostApiProvider {
  Future<List<Post>> getAllPosts() async {
    var url = "http://127.0.0.1:8000/api/v1/";
    Response response = await Dio().get(url);

    return (response.data as List).map((post) {
      DBProvider.db.createPost(Post.fromJson(post));
    }).toList();
  }
}
