class Tile {
  final String terrainType;
  final Map<String, dynamic> effects;

  Tile({required this.terrainType, Map<String, dynamic>? effects})
      : effects = effects ?? {};

  factory Tile.fromJson(Map<String, dynamic> json) {
    return Tile(
      terrainType: json['terrainType'] as String,
      effects: Map<String, dynamic>.from(json['effects'] as Map? ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        'terrainType': terrainType,
        'effects': effects,
      };
}
