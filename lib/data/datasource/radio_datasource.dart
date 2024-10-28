import 'package:Islami/data/models/radio.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio);

  Future<List<RadioModel>> fetchRadios() async {
    final response = await dio.get('https://mp3quran.net/api/v3/radios?language=ar');

    if (response.statusCode == 200) {
      final data = List<Map<String, dynamic>>.from(response.data['radios']);
      return data.map((json) => RadioModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load radios');
    }
  }
}
