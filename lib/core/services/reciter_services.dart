import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://www.mp3quran.net/api/v3';

  Future<Map<String, dynamic>> fetchReciters() async {
    final response = await http.get(Uri.parse('$baseUrl/reciters?language=ar'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load reciters');
    }
  }
}
