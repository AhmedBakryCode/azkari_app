class PrayerTime {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerTime({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    return PrayerTime(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }
}

class DateInfo {
  final String hijriDate;
  final String gregorianDate;

  DateInfo({
    required this.hijriDate,
    required this.gregorianDate,
  });

  factory DateInfo.fromJson(Map<String, dynamic> json) {
    return DateInfo(
      hijriDate: json['hijri']['date'],
      gregorianDate: json['gregorian']['date'],
    );
  }
}
