import 'dart:convert';
import 'package:http/http.dart' as http;

class EventService {
  final String baseUrl = 'http://192.168.0.136:4000/api/events';

  // Obtener todos los eventos aprobados
  Future<List<dynamic>> getAll() async {
    final response = await http.get(Uri.parse('$baseUrl/approved'));
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching events: $error');
      return [];
    }
  }

  // Obtener evento por id
  Future<dynamic> getByID(String idEvento) async {
    final response = await http.get(Uri.parse('$baseUrl/find/$idEvento'));
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error fetching event by ID: $error');
      return null;
    }
  }
}
