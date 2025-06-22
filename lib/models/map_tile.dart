class MapTile {
  final String terrain;

  MapTile({required this.terrain});

  factory MapTile.fromJson(Map<String, dynamic> json) {
    return MapTile(terrain: json['terrain'] as String);
  }

  Map<String, dynamic> toJson() => {'terrain': terrain};
}
