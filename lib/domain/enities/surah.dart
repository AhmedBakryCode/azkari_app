class Surah {
  final int id;
  final String name;
  final int startPage;
  final int endPage;
  final bool makkia;
  final int type;

  Surah({
    required this.id,
    required this.name,
    required this.startPage,
    required this.endPage,
    required this.makkia,
    required this.type,
  });

  // Factory method to create a Surah object from JSON
  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      id: json['id'],
      name: json['name'],
      startPage: json['start_page'],
      endPage: json['end_page'],
      makkia: json['makkia'] == 1,
      type: json['type'],
    );
  }

  // Method to parse a list of Surahs from JSON data
  static List<Surah> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Surah.fromJson(json)).toList();
  }
}
