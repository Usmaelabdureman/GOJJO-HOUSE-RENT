
import 'dart:io';

import 'package:bet_kray/Request/local_database_provider/database_provider.dart';
import 'package:bet_kray/Request/models/req_models.dart';
import 'package:http/http.dart' as http;

// this is used to get all the requests from api
// using the return of this class we can create a screen an display the data
class RequestApiProvider {
  Future<List<UserRequest>> getAllRequest() async {
   var url = "http://127.0.0.1:8000/request/";

    final response = await http.get(Uri.parse(url));
    return (response.body as List).map((request) {
      DatabaseProvider.database.createRequest(UserRequest.fromJson(request));
    }).toList();

  }
}