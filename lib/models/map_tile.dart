import 'package:json_annotation/json_annotation.dart';

part 'map_tile.g.dart';

@JsonSerializable()
class MapTile {
  final String terrain;

  MapTile({required this.terrain});

  factory MapTile.fromJson(Map<String, dynamic> json) =>
      _$MapTileFromJson(json);

  Map<String, dynamic> toJson() => _$MapTileToJson(this);
}
