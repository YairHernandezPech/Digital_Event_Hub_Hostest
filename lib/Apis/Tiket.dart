import 'dart:convert';
import 'package:hostess_digital/Login/Token.dart';
import 'package:http/http.dart' as http;

class TiketService {
  final String baseUrl = 'http://192.168.3.142:4000/api/ticket/scan';

  Future<dynamic> create(String ticketCode) async {
    String? token = Token().token;
    
    final url = Uri.parse(baseUrl);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final body = jsonEncode({'ticketCode': ticketCode});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Verificar si la respuesta es JSON
        if (response.headers['content-type']?.contains('application/json') ?? false) {
          return jsonDecode(response.body); // Si es JSON, decodificarlo
        } else {
          return response.body; // Si no es JSON, devolver el texto tal cual
        }
      } else {
        return response.body; // Devuelve el cuerpo de la respuesta de error
      }
    } catch (error) {
      return {'error': 'Error al conectar con el servidor: $error'};
    }
  }
}