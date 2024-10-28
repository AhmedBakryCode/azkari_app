import 'dart:convert';
import 'package:Islami/domain/enities/surah.dart';
import 'package:flutter/services.dart';

class SurahRepository {
  // Load JSON data from assets
  Future<List<Surah>> loadSurahs() async {
    final String response = await rootBundle.loadString('assets/suwar.json');
    final data = json.decode(response);
    List<Surah> surahs = (data['suwar'] as List).map((json) => Surah.fromJson(json)).toList();
    return surahs;
  }
}
