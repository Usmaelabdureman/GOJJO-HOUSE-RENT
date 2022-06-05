import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepository {
  Login(String email, String password) async {
    final response = await http.post(Uri.parse("http://127.0.0.1:8000/login/"),
        headers: {}, body: {"email": email, "password": password});
    final token = json.decode(response.body);
    if (response.statusCode == 200) {
      return token;
    } else {
      return false;
    }
  }
}
