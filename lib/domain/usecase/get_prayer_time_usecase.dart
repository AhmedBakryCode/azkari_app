import 'package:Islami/data/datasource/prayer_time_api.dart';


class GetPrayerTimesUseCase {
  final PrayerTimeApi api;

  GetPrayerTimesUseCase(this.api);

  Future<Map<String, dynamic>> call(String city, String country) async {
    return await api.fetchPrayerTimes(city, country);
  }
}
