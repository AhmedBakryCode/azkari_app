import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prayer_time_model.dart';

class PrayerTimeApi {
  Future<Map<String, dynamic>> fetchPrayerTimes(String city, String country) async {
    final url = Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=8');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      return data;
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}
