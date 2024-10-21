import 'dart:convert';
import 'package:hostess_digital/Components/Login/Token.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final String apiUrl = "http://192.168.3.142:4000/api/users/login";

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create account');
    }

    final responseBody = json.decode(response.body);
    if (responseBody.containsKey('token')) {
      String token = responseBody['token'];
      Token().token = token;
    }

    return responseBody;
  }
}
