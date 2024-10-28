import 'package:Islami/domain/usecase/get_prayer_time_usecase.dart';
import 'package:flutter/material.dart';

class PrayerTimeProvider with ChangeNotifier {
  final GetPrayerTimesUseCase getPrayerTimesUseCase;

  Map<String, dynamic>? prayerData;
  bool isLoading = false;

  PrayerTimeProvider(this.getPrayerTimesUseCase) {
    // Load Cairo, Egypt as default
    loadPrayerTimes('Cairo', 'Egypt');
  }

  Future<void> loadPrayerTimes(String city, String country) async {
    isLoading = true;
    notifyListeners();

    try {
      prayerData = await getPrayerTimesUseCase(city, country);
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
