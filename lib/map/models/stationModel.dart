class Station {
  final String name;
  final Pos position; // Changed from List<Pos> to a single Pos object
  final String city;
  final String town;

  Station({
    required this.name,
    required this.position,
    required this.city,
    required this.town,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      name: json['Name'] as String,
      position: Pos.fromJson(json['Position'] as Map<String, dynamic>),
      city: json['City'] as String,
      town: json['Town'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Position': position.toJson(),
      'City': city,
      'Town': town,
    };
  }
}

class Pos {
  final double long;
  final double lat;

  Pos({
    required this.long,
    required this.lat,
  });

  factory Pos.fromJson(Map<String, dynamic> json) {
    return Pos(
      long: json['Long'] as double,
      lat: json['Lat'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Long': long,
      'Lat': lat,
    };
  }
}