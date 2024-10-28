class Reciter {
  final int id;
  final String name;
  final String letter;
  final List<Moshaf> moshaf;

  Reciter({
    required this.id,
    required this.name,
    required this.letter,
    required this.moshaf,
  });

  factory Reciter.fromJson(Map<String, dynamic> json) {
    return Reciter(
      id: json['id'],
      name: json['name'],
      letter: json['letter'],
      moshaf: List<Moshaf>.from(
        json['moshaf'].map((item) => Moshaf.fromJson(item)),
      ),
    );
  }
}

class Moshaf {
  final int id;
  final String name;
  final String server;

  Moshaf({
    required this.id,
    required this.name,
    required this.server,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) {
    return Moshaf(
      id: json['id'],
      name: json['name'],
      server: json['server'],
    );
  }
}
