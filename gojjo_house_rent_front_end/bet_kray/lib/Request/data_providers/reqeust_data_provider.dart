import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/request_model.dart';

class RequestDataProvider {
  static const String _baseUrl = "http://127.0.0.1:8000/request/";

  Future<UserRequest> create(UserRequest request) async {
   
    final preference  = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');
    print(access_token);
    final http.Response response = await http.post(Uri.parse(_baseUrl),

        headers: <String, String>{
        "content-Type": "application/json",
        'Authorization':'Bearer $access_token',
        },
        body: jsonEncode({
          "city": request.city,
          "subcity": request.subcity,
          "bedroom": request.bedroom,
          "description": request.description,
        }));
    if (response.statusCode == 201) {
      return UserRequest.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("failed to create request");
    }
  }

  Future<UserRequest> fetchRequest(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl$id/"));
    if (response.statusCode == 200) {
      return UserRequest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching request detail failed");
    }
  }

  Future<List<UserRequest>> fetchAllRequests() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final requests = jsonDecode(response.body) as List;
      return requests.map((e) => UserRequest.fromJson(e)).toList();
    } else {
      throw Exception("Could not load");
    }
  }

  Future<List<UserRequest>> fetchUserRequest() async {
    
    final response = await http.get(Uri.parse('$_baseUrl/userequests/'));

    if (response.statusCode == 200) {
      final requests = jsonDecode(response.body) as List;
      return requests.map((e) => UserRequest.fromJson(e)).toList();
    } else {
      throw Exception("Could not load");
    }
  }

  Future<UserRequest> update(int id, UserRequest request) async {
    final preference  = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');

    final response = await http.put(Uri.parse("$_baseUrl$id/"),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization':'Bearer $access_token',
          },
        body: jsonEncode({
          "id": id,
          "city": request.city,
          "subcity": request.subcity,
          "bedroom": request.bedroom,
          "description": request.description,
        }));

    if (response.statusCode == 200) {
      return UserRequest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("could not update the request");
    }
  }

  Future<void> delete(int id) async {
     final preference  = await SharedPreferences.getInstance();
    String? access_token = preference.getString('access');
    final response = await http.delete(Uri.parse("$_baseUrl$id/"),
     headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization':'Bearer $access_token',
          },
    );
    if (response.statusCode != 204) {
      throw Exception("couldn't delete the request");
    }
  }
}
