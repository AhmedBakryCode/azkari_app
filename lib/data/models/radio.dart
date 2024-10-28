
import 'package:Islami/domain/enities/radio.dart';

class RadioModel extends Radio {
  RadioModel({
    required int id,
    required String name,
    required String url,
    required String recentDate,
  }) : super(id: id, name: name, url: url, recentDate: recentDate);

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      recentDate: json['recent_date'],
    );
  }
}
