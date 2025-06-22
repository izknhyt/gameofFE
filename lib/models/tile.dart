import 'package:json_annotation/json_annotation.dart';

part 'tile.g.dart';

@JsonSerializable()
class Tile {
  final String terrainType;
  final Map<String, dynamic> effects;

  Tile({required this.terrainType, Map<String, dynamic>? effects})
      : effects = effects ?? {};

  factory Tile.fromJson(Map<String, dynamic> json) => _$TileFromJson(json);

  Map<String, dynamic> toJson() => _$TileToJson(this);
}
