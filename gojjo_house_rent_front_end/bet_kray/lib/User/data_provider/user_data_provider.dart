import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserDataProvider {
  static const String baseUrl = "http://127.0.0.1:8000/create/";
  static const String _baseUrl = "http://127.0.0.1:8000/users/";

  Future<User> createUser(User user) async {
    final http.Response response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": user.email,
          "username": user.username,
          "first_name": user.first_name,
          "middle_name": user.middle_name,
          "password": user.password,
        }));

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Field to create user.");
    }
  }

  Future<User> fetchUserDetails(int id) async {
    final preference = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');
    final response = await http.get(
      Uri.parse("$baseUrl$id/"),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer $access_token',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch user details.");
    }
  }

  Future<List<User>> fetchAllUser() async {
    final preference = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');

    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer $access_token',
      },
    );

    if (response.statusCode == 200) {
      final posts = jsonDecode(response.body) as List;
      return posts.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception("Could not fetch the posts");
    }
  }

  Future<User> updateUserData(int id, User user) async {
    final preference = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');

    final response = await http.put(Uri.parse("$baseUrl$id/"),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $access_token',
        },
        body: jsonEncode({
          "email": user.email,
          "username": user.username,
          "first_name": user.first_name,
          "middle_name": user.middle_name,
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the post.");
    }
  }

  Future<void> delete(int id) async {
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
      throw Exception("Failed to delete the user.");
    }
  }
}
